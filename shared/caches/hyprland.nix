{
  config,
  lib,
  ...
}: {
  options.caches.hyprland.enable = lib.mkEnableOption "";

  config = lib.mkIf config.caches.hyprland.enable {
    nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  };
}
