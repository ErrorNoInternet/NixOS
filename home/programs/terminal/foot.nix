{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.profiles.desktop.enable {
    programs.foot = with config.colorScheme.colors; {
      enable = true;
      settings = {
        main = {
          font = "${config.font.name}:size=9";
          pad = "5x5 center";
          shell = "tmux";
          initial-window-size-pixels = "1920x1080";
        };
        cursor = {
          style = "beam";
          blink = "yes";
          color = "${base04} ${base04}";
        };
        mouse.hide-when-typing = "yes";
        colors = {
          alpha = "${builtins.toString config.opacity.normal}";
          background = "${base00}";
          foreground = "${base04}";
          regular0 = "${base01}";
          regular1 = "${base08}";
          regular2 = "${base0B}";
          regular3 = "${base0A}";
          regular4 = "${base0D}";
          regular5 = "${base0E}";
          regular6 = "${base0C}";
          regular7 = "${base05}";
          bright0 = "${base03}";
          bright1 = "${base08}";
          bright2 = "${base0B}";
          bright3 = "${base0A}";
          bright4 = "${base0D}";
          bright5 = "${base0E}";
          bright6 = "${base07}";
          bright7 = "${base06}";
        };
      };
    };
  };
}
