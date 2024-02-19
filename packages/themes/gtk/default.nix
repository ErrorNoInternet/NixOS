{
  systems = ["aarch64-linux" "x86_64-linux"];
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      gtk-theme-nordic = callPackage ./nordic {};
    };
  };
}
