{ config, pkgs, ... }:

let
    hostLocation = (builtins.readFile "/etc/nixos/variables/hostLocation");
    hostType = (builtins.readFile "/etc/nixos/variables/hostType");

    secrets = import secrets/secrets.nix;
in
{
    imports = [
        ./hardware-configuration.nix
        (import ./base.nix { inherit pkgs secrets; })
        "/etc/nixos/locations/${hostLocation}.nix"
        (import "/etc/nixos/${hostType}.nix" { inherit pkgs; })
    ];
}
