{
  config,
  custom,
  ...
}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "${custom.font}:size=9";
        pad = "0x0 center";
        shell = "tmux";
      };
      cursor = {
        style = "beam";
        blink = "yes";
      };
      colors = {
        alpha = "${custom.opacity}";
        background = "${config.colorScheme.colors.base00}";
        foreground = "${config.colorScheme.colors.base04}";
        regular0 = "${config.colorScheme.colors.base01}";
        regular1 = "${config.colorScheme.colors.base08}";
        regular2 = "${config.colorScheme.colors.base0B}";
        regular3 = "${config.colorScheme.colors.base0A}";
        regular4 = "${config.colorScheme.colors.base0D}";
        regular5 = "${config.colorScheme.colors.base0E}";
        regular6 = "${config.colorScheme.colors.base0C}";
        regular7 = "${config.colorScheme.colors.base05}";
        bright0 = "${config.colorScheme.colors.base03}";
        bright1 = "${config.colorScheme.colors.base08}";
        bright2 = "${config.colorScheme.colors.base0B}";
        bright3 = "${config.colorScheme.colors.base0A}";
        bright4 = "${config.colorScheme.colors.base0D}";
        bright5 = "${config.colorScheme.colors.base0E}";
        bright6 = "${config.colorScheme.colors.base07}";
        bright7 = "${config.colorScheme.colors.base06}";
      };
    };
  };
}
