{
  config,
  inputs',
  lib,
  pkgs,
  self',
  ...
}: let
  cfg = config.profiles.windowManager;
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.windowManager.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    wallpaper.enable = true;

    home.packages = with pkgs; [
      brightnessctl
      cliphist
      inputs'.hyprwm-contrib.packages.grimblast
      libnotify
      libsForQt5.qtimageformats
      pavucontrol
      playerctl
      ripdrag
      satty
      self'.packages.pavolume
      slurp
      swayidle
      vimiv-qt
      wf-recorder
      wl-clipboard
      wlr-randr
    ];
  };
}
