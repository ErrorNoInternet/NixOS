{
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      yaziPlugin-keyjump = callPackage ./keyjump.nix {};
      yaziPlugin-bookmarks = callPackage ./bookmarks.nix {};
    };
  };
}
