{ config, custom, pkgs }:

pkgs.writeShellApplication {
  name = "custom-swaylock";
  runtimeInputs = [ pkgs.swaylock-effects ];
  text = ''
    swaylock \
      --indicator-radius 90 \
      --indicator-thickness 15 \
      --inside-color ${config.colorScheme.colors.base00} \
      --inside-clear-color ${config.colorScheme.colors.base00} \
      --inside-ver-color ${config.colorScheme.colors.base00} \
      --inside-wrong-color ${config.colorScheme.colors.base00} \
      --key-hl-color ${config.colorScheme.colors.base0B} \
      --bs-hl-color ${config.colorScheme.colors.base09} \
      --ring-color ${config.colorScheme.colors.base03} \
      --ring-clear-color ${config.colorScheme.colors.base0A} \
      --ring-wrong-color ${config.colorScheme.colors.base08} \
      --ring-ver-color ${config.colorScheme.colors.base0D} \
      --separator-color ${config.colorScheme.colors.base03} \
      --text-color ${config.colorScheme.colors.base04} \
      --text-clear-color ${config.colorScheme.colors.base04} \
      --text-ver-color ${config.colorScheme.colors.base04} \
      --text-wrong-color ${config.colorScheme.colors.base04} \
      --text-caps-lock-color ${config.colorScheme.colors.base09} \
      --line-uses-ring \
      --font "${custom.font}" \
      --font-size 25 \
      --screenshot \
      --grace "$1" \
      --fade-in "$2" \
      --effect-blur 10x10 \
      --clock \
      --daemonize
  '';
}
