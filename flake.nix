{
    description = "ErrorNoInternet's NixOS flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs }:
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
            inherit system;
            config = {
                allowUnfree = true;
            };
        };
    in
    {
        nixosConfigurations = {
            NixBtw = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit pkgs; };
                modules = [
                    ./workstation/base.nix
                    ./workstation/locations/china.nix
                    ./workstation/hosts/NixBtw/NixBtw.nix
                    ./workstation/hosts/NixBtw/hardware-configuration.nix
                    ./workstation/modules/openrgb.nix
                    ./workstation/modules/video-acceleration.nix
                    ./workstation/modules/bluetooth.nix
                    ./workstation/modules/gaming.nix
                    ./workstation/modules/nvidia.nix
                    ./workstation/modules/nvidia-prime.nix
                    ./workstation/modules/virtualization.nix
                ];
            };
        };
    };
}
