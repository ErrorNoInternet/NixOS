{
  inputs,
  pkgs,
  self,
  ...
}: let
  defaultModule = {
    imports = [
      ./common.nix
      ../shared
      ./locations/china.nix
      ../shared/caches/ErrorNoBinaries.nix
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
        ./hosts/NixBtw/hardware-configuration.nix
        ./hosts/NixBtw/NixBtw.nix
        ./modules/android-development.nix
        ./modules/bluetooth.nix
        ./modules/gaming.nix
        ./modules/nvidia-options.nix
        ./modules/nvidia.nix
        ./modules/video-acceleration.nix
        ./modules/virtualization.nix
        ./programs/clamav.nix
        ./programs/fish.nix
        ./programs/hyprland.nix
        ./programs/openrgb.nix
        ../shared/caches/hyprland.nix
        ../shared/caches/nix-gaming.nix
        ../shared/modules/aarch64-emulation.nix
        ../shared/modules/btrfs-subvolume-compression.nix
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
        ./hosts/Rescanix/hardware-configuration.nix
        ./hosts/Rescanix/Rescanix.nix
        ./modules/bluetooth.nix
        ./modules/gaming.nix
        ./modules/nvidia-options.nix
        ./modules/nvidia.nix
        ./modules/video-acceleration.nix
        ./modules/virtualization.nix
        ./modules/vm-guest.nix
        ./modules/zfs.nix
        ./programs/clamav.nix
        ./programs/fish.nix
        ./programs/hyprland.nix
        ./programs/openrgb.nix
        ../shared/caches/hyprland.nix
        ../shared/caches/nix-gaming.nix
        ../shared/modules/aarch64-emulation.nix
        ../shared/modules/btrfs-compression.nix
      ];
    };
  };
}
