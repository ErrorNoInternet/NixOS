{
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      fcitx5Theme-nord = callPackage ./nord.nix {};
    };
  };
}
