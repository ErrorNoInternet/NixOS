{
  inputs,
  pkgs,
  self,
  ...
}: let
  defaultModule = {
    imports = [
      ../shared
      ../shared/caches/ErrorNoBinaries.nix
      ../shared/caches/nix-community.nix
      ./common.nix
      ./locations/china.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {inherit inputs self;};
        };
      }
    ];
  };
  inherit (inputs.nixpkgs.lib) nixosSystem;
in {
  flake.nixosConfigurations = {
    NixBtw = nixosSystem {
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      specialArgs = {inherit inputs self;};
      modules = [
        defaultModule
        ../shared/caches/hyprland.nix
        ../shared/caches/nix-gaming.nix
        ../shared/modules/aarch64-emulation.nix
        ../shared/modules/btrfs-subvolume-compression.nix
        ./hosts/NixBtw
        ./modules/bluetooth.nix
        ./modules/nvidia-options.nix
        ./modules/nvidia.nix
        ./modules/video-acceleration.nix
        ./modules/virtualization.nix
        ./profiles/android-development.nix
        ./profiles/gaming.nix
        ./programs/clamav.nix
        ./programs/fish.nix
        ./programs/hyprland.nix
        ./programs/openrgb.nix
        {home-manager.users.ryan = import ../home/hosts/NixBtw.nix;}
      ];
    };
    Rescanix = nixosSystem {
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      specialArgs = {inherit inputs self;};
      modules = [
        defaultModule
        ../shared/caches/hyprland.nix
        ../shared/caches/nix-gaming.nix
        ../shared/modules/aarch64-emulation.nix
        ../shared/modules/btrfs-compression.nix
        ./hosts/Rescanix
        ./modules/bluetooth.nix
        ./modules/nvidia-options.nix
        ./modules/nvidia.nix
        ./modules/video-acceleration.nix
        ./modules/virtualization.nix
        ./modules/zfs.nix
        ./profiles/gaming.nix
        ./profiles/vm-guest.nix
        ./programs/clamav.nix
        ./programs/fish.nix
        ./programs/hyprland.nix
        ./programs/openrgb.nix
        {home-manager.users.ryan = import ../home/hosts/Rescanix.nix;}
      ];
    };
  };
}
