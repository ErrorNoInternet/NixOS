{
  perSystem =
    { pkgs, ... }:
    {
      packages = with pkgs; {
        fcitx5-theme-nord = callPackage ./nord.nix { };
      };
    };
}
