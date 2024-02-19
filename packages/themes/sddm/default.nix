{
  systems = ["aarch64-linux" "x86_64-linux"];
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      sddm-theme-corners = callPackage ./corners.nix {};
    };
  };
}
