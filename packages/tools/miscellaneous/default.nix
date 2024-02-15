{
  systems = ["x86_64-linux" "aarch64-linux"];
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    packages = with pkgs; {
      attic = callPackage ./attic {inherit inputs';};
      hwatch = callPackage ./hwatch {};
      openrgb = openrgb.withPlugins [openrgb-plugin-effects];
      openrgb-libusb = callPackage ./openrgb {};
    };
  };
}
