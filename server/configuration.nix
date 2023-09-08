{ config, pkgs, ... }:

let
    hostSettings = import ./host-settings.nix;
    secrets = import secrets/secrets.nix;
in
{
    imports = [
        ./hardware-configuration.nix
        (import ./base.nix { inherit pkgs secrets; })
        "/etc/nixos/locations/${hostSettings.location}.nix"
        (import "/etc/nixos/${hostSettings.type}.nix" { inherit pkgs; })
    ];
}
