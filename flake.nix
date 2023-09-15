{
    description = "ErrorNoInternet's NixOS flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        agenix.url = "github:ryantm/agenix";
        spicetify-nix.url = "github:the-argus/spicetify-nix";
    };

    outputs = { self, nixpkgs, home-manager, agenix, spicetify-nix } @ inputs:
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
            Crix = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit pkgs; };
                modules = [
                    ./server/base.nix
                    ./server/locations/china.nix
                    ./server/hosts/Crix/Crix.nix
                    ./server/hosts/Crix/hardware-configuration.nix
                    ./server/modules/minecraft-server.nix
                ];
            };
        };
        homeConfigurations.ryan = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = { inherit inputs; };
            modules = [
                agenix.homeManagerModules.default
                ./home-manager/hosts/NixBtw.nix
                ./home-manager/modules/spicetify.nix
            ];
        };
    };
}
