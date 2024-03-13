{
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      vimPlugin-textobj-indent = callPackage ./textobj-indent.nix {};
    };
  };
}
