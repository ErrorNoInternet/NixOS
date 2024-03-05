{
  perSystem =
    { pkgs, ... }:
    {
      packages = with pkgs; {
        vim-plugin-textobj-indent = callPackage ./textobj-indent.nix { };
      };
    };
}
