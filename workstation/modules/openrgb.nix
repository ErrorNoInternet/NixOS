{ pkgs, ... }:

{
  boot.kernelModules = [ "i2c-dev" "i2c-piix4" ];
  environment.systemPackages = with pkgs; [
    (openrgb.withPlugins [ openrgb-plugin-effects ])
  ];
}
