{
  config,
  pkgs,
  ...
}: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      clock = true;
      screenshot = true;
      effect-blur = "10x10";

      font = "${config.font.name}";
      font-size = 25;

      indicator-radius = 90;
      indicator-thickness = 15;

      bs-hl-color = "${config.colorScheme.colors.base09}";
      key-hl-color = "${config.colorScheme.colors.base0B}";

      inside-clear-color = "${config.colorScheme.colors.base00}";
      inside-color = "${config.colorScheme.colors.base00}";
      inside-ver-color = "${config.colorScheme.colors.base00}";
      inside-wrong-color = "${config.colorScheme.colors.base00}";

      line-uses-ring = true;
      ring-clear-color = "${config.colorScheme.colors.base0A}";
      ring-color = "${config.colorScheme.colors.base03}";
      ring-ver-color = "${config.colorScheme.colors.base0D}";
      ring-wrong-color = "${config.colorScheme.colors.base08}";
      separator-color = "${config.colorScheme.colors.base03}";

      text-caps-lock-color = "${config.colorScheme.colors.base09}";
      text-clear-color = "${config.colorScheme.colors.base04}";
      text-color = "${config.colorScheme.colors.base04}";
      text-ver-color = "${config.colorScheme.colors.base04}";
      text-wrong-color = "${config.colorScheme.colors.base04}";
    };
  };
}
