{
  config,
  custom,
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [pkgs.rofi-emoji];
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
      base00RGBA = "rgba(${builtins.toString (lib.intersperse ", " (inputs.nix-colors.lib.conversions.hexToRGB config.colorScheme.colors.base00))}, ${custom.menuOpacity})";
    in {
      "*" = {
        background-color = mkLiteral "${base00RGBA}";
        text-color = mkLiteral "#${config.colorScheme.colors.base06}";
      };

      "configuration" = {
        disable-history = mkLiteral "false";
        display-drun = "";
        drun-display-format = "{name}";
        font = "${custom.font} 9";
        fullscreen = mkLiteral "false";
        hide-scrollbar = mkLiteral "true";
        icon-theme = "${custom.gtkIconTheme.name}";
        show-icons = mkLiteral "true";
        sidebar-mode = mkLiteral "false";
      };

      "window" = {
        background-color = mkLiteral "${base00RGBA}";
        border = mkLiteral "2px";
        border-color = mkLiteral "#${config.colorScheme.colors.base0D}";
        border-radius = mkLiteral "16px";
        location = mkLiteral "center";
        text-color = mkLiteral "#${config.colorScheme.colors.base06}";
        transparency = "real";
        width = mkLiteral "500px";
        x-offset = mkLiteral "0";
        y-offset = mkLiteral "0";
      };

      "prompt" = {
        background-color = mkLiteral "#${config.colorScheme.colors.base01}";
        enabled = mkLiteral "true";
        font = "${custom.font} 9";
        padding = mkLiteral "10px 15px 10px 15px";
        text-color = mkLiteral "#${config.colorScheme.colors.base06}";
      };

      "entry" = {
        background-color = mkLiteral "#${config.colorScheme.colors.base01}";
        blink = mkLiteral "true";
        expand = mkLiteral "true";
        horizontal-align = mkLiteral "0";
        margin = mkLiteral "0px 0px 0px 0px";
        padding = mkLiteral "10px 15px 10px 10px";
        placeholder = "Search...";
        placeholder-color = mkLiteral "#${config.colorScheme.colors.base03}";
        text-color = mkLiteral "#${config.colorScheme.colors.base06}";
      };

      "inputbar" = {
        background-color = mkLiteral "#${config.colorScheme.colors.base02}";
        border-radius = mkLiteral "0px";
        children = map mkLiteral ["prompt" "entry"];
        expand = mkLiteral "false";
        spacing = mkLiteral "0px";
        text-color = mkLiteral "#${config.colorScheme.colors.base06}";
      };

      "listview" = {
        background-color = mkLiteral "${base00RGBA}";
        cycle = mkLiteral "true";
        dynamic = mkLiteral "true";
        layout = mkLiteral "vertical";
        lines = mkLiteral "10";
        padding = mkLiteral "10px 10px 10px 10px";
        spacing = mkLiteral "5px";
      };

      "mainbox" = {
        background-color = mkLiteral "${base00RGBA}";
        border = mkLiteral "0px";
        border-color = mkLiteral "#${config.colorScheme.colors.base03}";
        border-radius = mkLiteral "0px";
        children = map mkLiteral ["inputbar" "listview"];
        padding = mkLiteral "0px";
        spacing = mkLiteral "0px";
      };

      "element" = {
        background-color = mkLiteral "transparent";
        border-radius = mkLiteral "10px";
        orientation = mkLiteral "horizontal";
        padding = mkLiteral "6px";
        text-color = mkLiteral "#${config.colorScheme.colors.base06}";
      };

      "element-icon" = {
        background-color = mkLiteral "transparent";
        border = mkLiteral "0px";
        size = mkLiteral "24px";
        text-color = mkLiteral "inherit";
      };

      "element-text" = {
        background-color = mkLiteral "transparent";
        expand = mkLiteral "true";
        horizontal-align = mkLiteral "0";
        margin = mkLiteral "0px 2.5px 0px 2.5px";
        text-color = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
      };

      "element selected" = {
        background-color = mkLiteral "#${config.colorScheme.colors.base06}";
        border-radius = mkLiteral "10px";
        text-color = mkLiteral "#${config.colorScheme.colors.base00}";
      };
    };
  };
}
