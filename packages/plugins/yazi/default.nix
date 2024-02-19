{
  systems = ["aarch64-linux" "x86_64-linux"];
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      yazi-plugin-keyjump = callPackage ./keyjump.nix {};
      yazi-plugin-bookmarks = callPackage ./bookmarks.nix {};
    };
  };
}
