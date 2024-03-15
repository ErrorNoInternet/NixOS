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
      (wf-recorder.overrideAttrs (_: {
        src = fetchFromGitHub {
          owner = "ammen99";
          repo = "wf-recorder";
          rev = "060ddc50268a775419f19d2403fdcfd8b985564b";
          hash = "sha256-TAFUwHLaA/zsTBiR2qqwcv8NCIaHWnBm7LsnI1fo/o4=";
        };
      }))
      wl-clipboard
      wlr-randr
    ];
  };
}
