{
  inputs,
  self,
  ...
}: let
  defaultModule = {
    imports = [
      inputs.agenix.homeManagerModules.default
      ../shared/caches/ErrorNoBinaries.nix
      ./common.nix
      ./locations/china.nix
      ./programs/nix.nix
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
      pkgs = import inputs.nixpkgs {system = "x86_64-linux";};
      extraSpecialArgs = {inherit inputs self;};
      modules = [
        defaultModule
        ./hosts/Rescanix.nix
        ./programs/spicetify.nix
        ./shared/caches/hyprland.nix
        ./shared/caches/nix-gaming.nix
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
