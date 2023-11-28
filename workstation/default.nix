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
      ./common.nix
      ./locations/china.nix
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
        ./hosts/NixBtw/hardware-configuration.nix
        ./hosts/NixBtw/NixBtw.nix
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
        ./hosts/Rescanix/hardware-configuration.nix
        ./hosts/Rescanix/Rescanix.nix
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
      ];
    };
  };
}
