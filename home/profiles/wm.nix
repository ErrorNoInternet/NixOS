{
  self,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../desktop/cursor.nix
    ../wayland/dunst.nix
    ../wayland/hyprpaper.nix
    ../wayland/rofi.nix
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
    self.packages.${pkgs.system}.hyprgamemode
    self.packages.${pkgs.system}.pavolume
    slurp
    swayidle
    vimiv-qt
    wf-recorder
    wl-clipboard
  ];
}
