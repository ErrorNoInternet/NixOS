{inputs, ...}: let
  defaultModule = {
    imports = [
      ../shared
      ../shared/caches/ErrorNoBinaries.nix
      ../shared/caches/nix-community.nix
      ./common.nix
      inputs.agenix.nixosModules.default
    ];
  };
  inherit (inputs.nixpkgs.lib) nixosSystem;
in {
  flake.nixosConfigurations = {
    Crix = nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        defaultModule
        ../shared/caches/ErrorNoBinaries.nix
        ../shared/modules/wireless.nix
        ./hosts/Crix
        ./locations/china.nix
        ./modules/bootloader.nix
        ./profiles/minecraft-server.nix
      ];
    };
    Pix = nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        defaultModule
        ../shared/caches/ErrorNoBinaries.nix
        ../shared/modules/raspberry-pi.nix
        ./hosts/Pix
        ./locations/china.nix
        ./modules/attic-cache.nix
        ./modules/nfs.nix
        ./modules/printing.nix
        ./modules/samba.nix
        ./programs/fish.nix
      ];
    };
  };
}
