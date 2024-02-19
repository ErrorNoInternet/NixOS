{
  systems = ["aarch64-linux" "x86_64-linux"];
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    packages = with pkgs; {
      attic = callPackage ./attic {inherit inputs';};
      hwatch = callPackage ./hwatch {};
      passgen = callPackage ./passgen {};
      savehw = callPackage ./savehw.nix {};
      tbw = callPackage ./tbw.nix {};

      openrgb = openrgb.withPlugins [openrgb-plugin-effects];
      openrgb-libusb = callPackage ./openrgb {};
    };
  };
}
