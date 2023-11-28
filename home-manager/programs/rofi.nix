{
  config,
  custom,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [pkgs.rofi-emoji];
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        background-color = mkLiteral "#${config.colorScheme.colors.base00}";
        text-color = mkLiteral "#${config.colorScheme.colors.base04}";
      };

      "configuration" = {
        font = "${custom.font} 9";
        show-icons = mkLiteral "true";
        icon-theme = "Colloid-nord-dark";
        display-drun = "";
        drun-display-format = "{name}";
        disable-history = mkLiteral "false";
        fullscreen = mkLiteral "false";
        hide-scrollbar = mkLiteral "true";
        sidebar-mode = mkLiteral "false";
      };

      "window" = {
        transparency = "real";
        background-color = mkLiteral "#${config.colorScheme.colors.base00}";
        text-color = mkLiteral "#${config.colorScheme.colors.base04}";
        border = mkLiteral "2px";
        border-color = mkLiteral "#${config.colorScheme.colors.base0D}";
        border-radius = mkLiteral "10px";
        width = mkLiteral "550px";
        location = mkLiteral "center";
        x-offset = mkLiteral "0";
        y-offset = mkLiteral "0";
      };

      "prompt" = {
        font = "${custom.font} 9";
        enabled = mkLiteral "true";
        padding = mkLiteral "10px 15px 10px 15px";
        background-color = mkLiteral "#${config.colorScheme.colors.base01}";
        text-color = mkLiteral "#${config.colorScheme.colors.base04}";
      };

      "entry" = {
        background-color = mkLiteral "#${config.colorScheme.colors.base01}";
        text-color = mkLiteral "#${config.colorScheme.colors.base04}";
        placeholder-color = mkLiteral "#${config.colorScheme.colors.base04}";
        expand = mkLiteral "true";
        horizontal-align = mkLiteral "0";
        placeholder = "Search...";
        padding = mkLiteral "10px 15px 10px 10px";
        margin = mkLiteral "0px 0px 0px 0px";
        blink = mkLiteral "true";
      };

      "inputbar" = {
        children = map mkLiteral ["prompt" "entry"];
        background-color = mkLiteral "#${config.colorScheme.colors.base02}";
        text-color = mkLiteral "#${config.colorScheme.colors.base04}";
        expand = mkLiteral "false";
        border = mkLiteral "0px";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "#${config.colorScheme.colors.base03}";
        spacing = mkLiteral "0px";
      };

      "listview" = {
        background-color = mkLiteral "#${config.colorScheme.colors.base00}";
        padding = mkLiteral "10px 10px 10px 10px";
        columns = mkLiteral "2";
        lines = mkLiteral "7";
        spacing = mkLiteral "5px";
        cycle = mkLiteral "true";
        dynamic = mkLiteral "true";
        layout = mkLiteral "vertical";
      };

      "mainbox" = {
        background-color = mkLiteral "#${config.colorScheme.colors.base00}";
        border = mkLiteral "0px";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "#${config.colorScheme.colors.base03}";
        children = map mkLiteral ["inputbar" "listview"];
        spacing = mkLiteral "0px";
        padding = mkLiteral "0px";
      };

      "element" = {
        background-color = mkLiteral "#${config.colorScheme.colors.base00}";
        text-color = mkLiteral "#${config.colorScheme.colors.base04}";
        orientation = mkLiteral "horizontal";
        border-radius = mkLiteral "0px";
        padding = mkLiteral "6px";
      };

      "element-icon" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        size = mkLiteral "24px";
        border = mkLiteral "0px";
      };

      "element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        expand = mkLiteral "true";
        horizontal-align = mkLiteral "0";
        vertical-align = mkLiteral "0.5";
        margin = mkLiteral "0px 2.5px 0px 2.5px";
      };

      "element selected" = {
        background-color = mkLiteral "#${config.colorScheme.colors.base04}";
        text-color = mkLiteral "#${config.colorScheme.colors.base00}";
        border = mkLiteral "0px";
        border-radius = mkLiteral "10px";
        border-color = mkLiteral "#${config.colorScheme.colors.base00}";
      };
    };
  };
}
