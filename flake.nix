{
    description = "ErrorNoInternet's NixOS flake";

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
        agenix.url = "github:ryantm/agenix";
        spicetify-nix.url = "github:the-argus/spicetify-nix";
        nix-gaming.url = "github:fufexan/nix-gaming";
    };

    outputs = { self, nixpkgs, home-manager, nix-on-droid, agenix, spicetify-nix, nix-gaming } @ inputs:
    let
        system = "x86_64-linux";
        overlays = [
            (self: super: {
                openrgb = super.openrgb.overrideAttrs (oldAttrs: {
                    patches = (oldAttrs.patches or []) ++ [
                        ./patches/openrgb-hidapi-libusb.patch
                    ];
                });
            })
            (self: super: {
                waybar = super.waybar.overrideAttrs (oldAttrs: {
                    mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
                });
            })
        ];
        pkgs = import nixpkgs {
            inherit overlays system;
            config.allowUnfree = true;
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
                    agenix.nixosModules.default
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
        nixOnDroidConfigurations.ErrorNoPhone = nix-on-droid.lib.nixOnDroidConfiguration {
            modules = [
                ./nix-on-droid/base.nix
                ./nix-on-droid/locations/china.nix
                ./nix-on-droid/hosts/ErrorNoPhone.nix
            ];
        };
    };
}
