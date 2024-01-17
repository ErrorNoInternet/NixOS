{
  config,
  inputs,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.windowManager.enable = mkEnableOption "";

  config = mkIf config.profiles.windowManager.enable {
    wallpaper.enable = true;

    home.packages = with pkgs; [
      cliphist
      inputs.hyprwm-contrib.packages.${system}.grimblast
      inputs.shadower.packages.${system}.shadower
      pavucontrol
      ripdrag
      self.packages.${system}.brightness
      self.packages.${system}.hyprgamemode
      self.packages.${system}.pavolume
      slurp
      swayidle
      vimiv-qt
      wf-recorder
      wl-clipboard
    ];
  };
}
