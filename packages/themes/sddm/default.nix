{
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      sddmTheme-corners = callPackage ./corners.nix {};
    };
  };
}
