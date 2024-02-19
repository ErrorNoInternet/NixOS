{
  systems = [
    "aarch64-darwin"
    "aarch64-linux"
    "x86_64-darwin"
    "x86_64-linux"
  ];
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      yazi-plugin-keyjump = callPackage ./keyjump.nix {};
      yazi-plugin-bookmarks = callPackage ./bookmarks.nix {};
    };
  };
}
