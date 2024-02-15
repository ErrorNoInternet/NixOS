{
  systems = ["x86_64-linux" "aarch64-linux"];
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      vim-plugin-textobj-indent = callPackage ./textobj-indent.nix {};
    };
  };
}
