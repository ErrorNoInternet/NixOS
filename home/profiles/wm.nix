{
  self,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../wayland/dunst.nix
    ../wayland/rofi.nix
    ../wayland/swaylock.nix
    ../wayland/waybar.nix
    ../wayland/wleave.nix
  ];

  cursor.enable = true;

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
}
