{
  inputs,
  self,
  ...
}: let
  defaultModule = {
    imports = [
      ../shared/caches/ErrorNoBinaries.nix
      ../shared/caches/nix-community.nix
      ./common.nix
      ./locations/china.nix
      ./programs/nix.nix
      inputs.agenix.homeManagerModules.default
    ];
  };
  inherit (inputs.home-manager.lib) homeManagerConfiguration;
in {
  flake.homeConfigurations = {
    "ryan@NixBtw" = homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      extraSpecialArgs = {inherit inputs self;};
      modules = [
        defaultModule
        ../shared/caches/hyprland.nix
        ../shared/caches/nix-gaming.nix
        ./hosts/NixBtw.nix
        ./programs/spicetify.nix
      ];
    };
    "ryan@Rescanix" = homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      extraSpecialArgs = {inherit inputs self;};
      modules = [
        defaultModule
        ../shared/caches/hyprland.nix
        ../shared/caches/nix-gaming.nix
        ./hosts/Rescanix.nix
        ./programs/spicetify.nix
      ];
    };
    "snowflake@Pix" = homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {system = "aarch64-linux";};
      extraSpecialArgs = {inherit inputs self;};
      modules = [
        defaultModule
        ./hosts/Pix.nix
      ];
    };
  };
}
