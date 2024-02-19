{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.profiles.windowManager.enable {
    programs.swaylock = with config.colors.scheme.palette; {
      enable = true;
      package = pkgs.swaylock-effects;

      settings = {
        clock = true;
        screenshot = true;
        effect-blur = "10x10";

        font = config.font.name;
        font-size = 25;

        indicator-radius = 90;
        indicator-thickness = 15;

        bs-hl-color = "${base09}";
        key-hl-color = "${base0B}";

        inside-clear-color = "${base00}";
        inside-color = "${base00}";
        inside-ver-color = "${base00}";
        inside-wrong-color = "${base00}";

        line-uses-ring = true;
        ring-clear-color = "${base0A}";
        ring-color = "${base03}";
        ring-ver-color = "${base0D}";
        ring-wrong-color = "${base08}";
        separator-color = "${base03}";

        text-caps-lock-color = "${base09}";
        text-clear-color = "${base04}";
        text-color = "${base04}";
        text-ver-color = "${base04}";
        text-wrong-color = "${base04}";
      };
    };
  };
}
