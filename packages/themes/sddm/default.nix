{
  systems = ["x86_64-linux" "aarch64-linux"];
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      sddm-theme-corners = callPackage ./corners.nix {};
    };
  };
}
