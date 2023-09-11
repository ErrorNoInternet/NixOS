{ config, pkgs, ... }:

{
    system.stateVersion = "23.05";
    environment.sessionVariables.HOSTNAME = "ErrorNoPhone";
    environment.motd = "";

    environment.packages = with pkgs; [
        fastfetch
        cmatrix

        exa
        (import ./nixos-repository/workstation/home-manager/derivations/hsize.nix {})

        python3
        rustup
        gcc
    ];
    home-manager = {
        config = ./nixos-repository/workstation/home-manager/home.nix;
        useUserPackages = true;
    };
}
