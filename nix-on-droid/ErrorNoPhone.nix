{ config, pkgs, ... }:

{
    system.stateVersion = "23.05";
    environment.sessionVariables.HOSTNAME = "ErrorNoPhone";
    environment.motd = "";

    environment.packages = with pkgs; [
        cmatrix
        neofetch

        (import ./nixos-repository/workstation/home-manager/derivations/hsize.nix {})
        exa
        git
        neovim

        gcc
        python3
        rustup
    ];
    home-manager = {
        config = ./nixos-repository/workstation/home-manager/home.nix;
        useUserPackages = true;
    };
}
