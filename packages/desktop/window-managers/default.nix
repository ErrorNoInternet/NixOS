{
  systems = ["aarch64-linux" "x86_64-linux"];
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    packages = with pkgs; {
      hyprland = callPackage ./hyprland {inherit inputs';};
    };
  };
}
