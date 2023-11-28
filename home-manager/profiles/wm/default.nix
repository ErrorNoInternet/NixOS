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
    ../../wayland/waybar.nix
  ];

  home.packages = with pkgs; [
    cliphist
    inputs.hyprwm-contrib.packages.${pkgs.system}.grimblast
    pavucontrol
    ripdrag
    self.packages.${pkgs.system}.brightness
    self.packages.${pkgs.system}.pavolume
    (self.packages.${pkgs.system}.swaylock.override {
      colorScheme = config.colorScheme;
      font = custom.font;
    })
    slurp
    swayidle
    swww
    wf-recorder
    wl-clipboard
  ];
}
