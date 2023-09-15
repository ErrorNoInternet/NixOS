{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        (openrgb.withPlugins [ openrgb-plugin-effects ])
    ];
}
