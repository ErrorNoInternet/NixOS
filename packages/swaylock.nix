{
  colorScheme ? null,
  font ? null,
  swaylock-effects,
  writeShellApplication,
  ...
}:
writeShellApplication {
  name = "custom-swaylock";
  runtimeInputs = [swaylock-effects];
  text = ''
    swaylock \
      --indicator-radius 90 \
      --indicator-thickness 15 \
      --inside-color ${colorScheme.colors.base00} \
      --inside-clear-color ${colorScheme.colors.base00} \
      --inside-ver-color ${colorScheme.colors.base00} \
      --inside-wrong-color ${colorScheme.colors.base00} \
      --key-hl-color ${colorScheme.colors.base0B} \
      --bs-hl-color ${colorScheme.colors.base09} \
      --ring-color ${colorScheme.colors.base03} \
      --ring-clear-color ${colorScheme.colors.base0A} \
      --ring-wrong-color ${colorScheme.colors.base08} \
      --ring-ver-color ${colorScheme.colors.base0D} \
      --separator-color ${colorScheme.colors.base03} \
      --text-color ${colorScheme.colors.base04} \
      --text-clear-color ${colorScheme.colors.base04} \
      --text-ver-color ${colorScheme.colors.base04} \
      --text-wrong-color ${colorScheme.colors.base04} \
      --text-caps-lock-color ${colorScheme.colors.base09} \
      --line-uses-ring \
      --font "${font}" \
      --font-size 25 \
      --screenshot \
      --grace "$1" \
      --fade-in "$2" \
      --effect-blur 10x10 \
      --clock \
      --daemonize
  '';
}
