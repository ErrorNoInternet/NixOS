{
  config,
  inputs',
  lib,
  pkgs,
  self',
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.windowManager.enable = mkEnableOption "";

  config = mkIf config.profiles.windowManager.enable {
    wallpaper.enable = true;

    home.packages = with pkgs; [
      cliphist
      inputs'.hyprwm-contrib.packages.grimblast
      inputs'.shadower.packages.shadower
      pavucontrol
      ripdrag
      satty
      self'.packages.brightness
      self'.packages.hyprgamemode
      self'.packages.pavolume
      slurp
      swayidle
      vimiv-qt
      wf-recorder
      wl-clipboard
    ];
  };
}
