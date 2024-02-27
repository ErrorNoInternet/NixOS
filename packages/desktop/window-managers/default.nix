{
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
