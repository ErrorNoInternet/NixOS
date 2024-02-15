{
  systems = ["x86_64-linux" "aarch64-linux"];
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      fcitx5-theme-nord = callPackage ./nord.nix {};
    };
  };
}
