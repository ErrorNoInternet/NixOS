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
  imports = [
    ../../wayland/dunst.nix
    ../../wayland/rofi.nix
    ../../wayland/swaylock.nix
    ../../wayland/waybar.nix
    ../../wayland/wleave.nix
  ];

  options.profiles.windowManager.enable = mkEnableOption "";

  config = mkIf config.profiles.windowManager.enable {
    wallpaper.enable = true;
    home.packages = with pkgs; [
      cliphist
      inputs.hyprwm-contrib.packages.${pkgs.system}.grimblast
      inputs.shadower.packages.${pkgs.system}.shadower
      pavucontrol
      ripdrag
      self.packages.${pkgs.system}.brightness
      self.packages.${pkgs.system}.hyprgamemode
      self.packages.${pkgs.system}.pavolume
      slurp
      swayidle
      vimiv-qt
      wf-recorder
      wl-clipboard
    ];
  };
}
