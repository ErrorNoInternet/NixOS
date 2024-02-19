{
  systems = ["aarch64-linux" "x86_64-linux"];
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      vim-plugin-textobj-indent = callPackage ./textobj-indent.nix {};
    };
  };
}
