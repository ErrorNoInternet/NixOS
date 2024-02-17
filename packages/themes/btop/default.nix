{
  systems = ["x86_64-linux" "aarch64-linux"];
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      btop-theme-catppuccin = callPackage ./catppuccin.nix {};
    };
  };
}
