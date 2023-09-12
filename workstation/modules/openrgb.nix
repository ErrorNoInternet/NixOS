{ pkgs, ... }:

{
    nixpkgs.overlays = [
        (self: super: {
            openrgb = super.openrgb.overrideAttrs (oldAttrs: {
                patches = (oldAttrs.patches or []) ++ [
                    ../patches/openrgb-hidapi-libusb.patch
                ];
            });
        })
    ];
    environment.systemPackages = with pkgs; [
        (openrgb.withPlugins [ openrgb-plugin-effects ])
    ];
}
