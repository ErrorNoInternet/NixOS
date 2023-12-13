{
  self,
  config,
  custom,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/cursor.nix
    ../../programs/dunst.nix
    ../../programs/rofi.nix
    ../../wayland/hyprpaper.nix
    ../../wayland/waybar.nix
  ];

  home.packages = with pkgs; [
    (self.packages.${pkgs.system}.swaylock.override {
      colorScheme = config.colorScheme;
      font = custom.font;
    })
    chayang
    cliphist
    inputs.hyprwm-contrib.packages.${pkgs.system}.grimblast
    pavucontrol
    ripdrag
    self.packages.${pkgs.system}.brightness
    self.packages.${pkgs.system}.pavolume
    slurp
    swayidle
    wf-recorder
    wl-clipboard
  ];
}
