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
        (import ./locations/${hostSettings.location}.nix { inherit pkgs secrets; })
        (import ./modules/${hostSettings.type}.nix { inherit pkgs secrets; })
    ];

    system.copySystemConfiguration = true;
    system.stateVersion = "23.05";
}
