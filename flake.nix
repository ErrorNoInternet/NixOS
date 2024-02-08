{
  description = "ErrorNoInternet's NixOS configuration";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-23.05";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
    nix-colors.url = "github:misterio77/nix-colors";
    nixvim.url = "github:nix-community/nixvim";

    attic.url = "github:zhaofengli/attic";
    hsize.url = "github:ErrorNoInternet/hsize";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprwm-contrib.url = "github:hyprwm/contrib";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    nix-gaming.url = "github:fufexan/nix-gaming";
    overmask.url = "github:ErrorNoInternet/overmask";
    shadower.url = "github:n3oney/shadower";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    waybar.url = "github:Alexays/Waybar";
    wezterm.url = "github:wez/wezterm?dir=nix";
    yazi.url = "github:sxyazi/yazi";
  };

  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        ./droid
        ./packages
        ./server
        ./workstation
      ];

      systems = ["x86_64-linux" "aarch64-linux"];
      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;

        devShells.default = pkgs.mkShell {
          name = "configuration.nix-shell";
          packages = with pkgs; [
            alejandra
            bat
            deadnix
            delta
            git
            neovim
            statix
          ];
        };
      };
    };
}
