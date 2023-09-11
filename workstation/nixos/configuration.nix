{ pkgs, ... }:

let
    hostSettings = import ./host-settings.nix;
in
{
    imports = [
        ./hardware-configuration.nix
        (import ./base.nix { inherit hostSettings pkgs; })
        (import ./extra.nix { inherit hostSettings pkgs; })
        (import "/etc/nixos/locations/${hostSettings.location}.nix" { inherit pkgs; })
        (import "/etc/nixos/hosts/${hostSettings.name}.nix" { inherit pkgs; })
    ];

    system.copySystemConfiguration = true;
    system.stateVersion = "23.05";
}
