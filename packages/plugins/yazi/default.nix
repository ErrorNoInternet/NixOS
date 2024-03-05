{
  perSystem =
    { pkgs, ... }:
    {
      packages = with pkgs; {
        yazi-plugin-keyjump = callPackage ./keyjump.nix { };
        yazi-plugin-bookmarks = callPackage ./bookmarks.nix { };
      };
    };
}
