{ pkgs, ... }:

let
    hostSettings = import ./host-settings.nix;
    secrets = import ./secrets/secrets.nix;
in
{
    imports = [
        ./hardware-configuration.nix
        (import ./base.nix { inherit hostSettings pkgs secrets; })
        (import ./extra.nix { inherit hostSettings pkgs secrets; })
        ./locations/${hostSettings.location}.nix
        (import ./modules/${hostSettings.type}.nix { inherit pkgs; })
    ];

    system.copySystemConfiguration = true;
    system.stateVersion = "23.05";
}
