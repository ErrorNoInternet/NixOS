{
  self,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../modules/cursor.nix
    ../programs/dunst.nix
    ../programs/rofi.nix
    ../wayland/hyprpaper.nix
    ../wayland/swaylock.nix
    ../wayland/waybar.nix
    ../wayland/wleave.nix
  ];

  home.packages = with pkgs; [
    cliphist
    inputs.hyprwm-contrib.packages.${pkgs.system}.grimblast
    inputs.shadower.packages.${pkgs.system}.shadower
    pavucontrol
    ripdrag
    self.packages.${pkgs.system}.brightness
    self.packages.${pkgs.system}.pavolume
    slurp
    swayidle
    vimiv-qt
    wf-recorder
    wl-clipboard
  ];
}
