{
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      gtk-theme-nordic = callPackage ./nordic {};
    };
  };
}
