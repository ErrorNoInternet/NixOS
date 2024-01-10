{
  inputs,
  pkgs,
  ...
}: {
  caches.hyprland.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
