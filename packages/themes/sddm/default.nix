{
  perSystem =
    { pkgs, ... }:
    {
      packages = with pkgs; {
        sddm-theme-corners = callPackage ./corners.nix { };
      };
    };
}
