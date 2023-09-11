{ config, pkgs, ... }:

{
    system.stateVersion = "23.05";
    environment.sessionVariables.HOSTNAME = "ErrorNoPhone";
    environment.motd = "";

    environment.packages = with pkgs; [
        (import ./nixos-repository/workstation/home-manager/derivations/hsize.nix {})
        cmatrix
        exa

        gcc
        python3
        rustup
    ];
    home-manager = {
        config = ./nixos-repository/workstation/home-manager/home.nix;
        useUserPackages = true;
    };
}
