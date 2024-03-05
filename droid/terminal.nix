{ config, ... }:
{
  terminal = {
    colors = with config.home-manager.config.colors.scheme.palette; {
      foreground = "#${base04}";
      background = "#${base00}";
      cursor = "#${base04}";
      color0 = "#${base01}";
      color1 = "#${base08}";
      color2 = "#${base0B}";
      color3 = "#${base0A}";
      color4 = "#${base0D}";
      color5 = "#${base0E}";
      color6 = "#${base0C}";
      color7 = "#${base05}";
      color8 = "#${base03}";
      color9 = "#${base08}";
      color10 = "#${base0B}";
      color11 = "#${base0A}";
      color12 = "#${base0D}";
      color13 = "#${base0E}";
      color14 = "#${base07}";
      color15 = "#${base06}";
    };
    font = ../other/fonts/JetBrainsMonoNerdFont-Regular.ttf;
  };
}
