{ config, pkgs, ... }:

let
    hostLocation = "china";
    hostType = "minecraft-server";

    secrets = import secrets/secrets.nix;
in
{
    imports = [
        ./hardware-configuration.nix
        (import ./base.nix { inherit pkgs secrets; })
        (import "/etc/nixos/locations/${hostLocation}.nix" {})
        (import "/etc/nixos/${hostType}.nix" { inherit pkgs; })
    ];
}
