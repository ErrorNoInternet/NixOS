{
  description = "ErrorNoInternet's Nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
    attic.url = "github:zhaofengli/attic";
    flake-parts.url = "github:hercules-ci/flake-parts";
    hsize.url = "github:ErrorNoInternet/hsize";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprwm-contrib.url = "github:hyprwm/contrib";
    neovim.url = "github:neovim/neovim?dir=contrib";
    nix-colors.url = "github:misterio77/nix-colors";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nixvim.url = "github:nix-community/nixvim";
    shadower.url = "github:n3oney/shadower";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    yazi.url = "github:sxyazi/yazi";
  };

  outputs = {
    self,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        ./packages
        ./workstation
        ./server
        ./droid
      ];

      flake = {
        homeManagerModules.default = import ./modules/home-manager.nix;
      };

      systems = ["x86_64-linux" "aarch64-linux"];
      perSystem = {pkgs, ...}: {
        _module.args = {inherit self;};

        formatter = pkgs.alejandra;

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            alejandra
            bat
            deadnix
            git
            neovim
          ];
          name = "configuration.nix-shell";
        };
      };
    };
}
