{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.rofi;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.customPrograms.rofi = {
    enable = mkEnableOption "" // {default = config.profiles.windowManager.enable;};

    commands = {
      default = mkOption {
        type = types.str;
        default = "rofi -modes drun,window,run -show drun || pkill rofi";
      };

      clipboard = mkOption {
        type = types.str;
        default = "cliphist list | (rofi -dmenu -window-title cb -no-show-icons || pkill rofi) | cliphist decode";
      };

      emoji = mkOption {
        type = types.str;
        default = "rofi -show emoji -no-show-icons || pkill rofi";
      };
    };
  };

  config = mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      package = with pkgs;
        rofi.override {
          rofi-unwrapped = rofi-wayland-unwrapped.overrideAttrs rec {
            version = "1.7.5+wayland2";
            src = fetchFromGitHub {
              owner = "lbonn";
              repo = "rofi";
              rev = version;
              fetchSubmodules = true;
              sha256 = "sha256-5pxDA/71PV4B5T3fzLKVC4U8Gt13vwy3xSDPDsSDAKU=";
            };
          };

          plugins = [
            rofi-emoji
          ];
        };

      theme = with config.colors.scheme.palette; let
        inherit (config.lib.formats.rasi) mkLiteral;

        base00RGBA = "rgba(${
          inputs.nix-colors.lib.conversions.hexToRGBString "," base00
        },${builtins.toString config.opacity.menu})";
      in {
        "*" = {
          background-color = mkLiteral base00RGBA;
          text-color = mkLiteral "#${base06}";
        };

        "configuration" = {
          disable-history = mkLiteral "false";
          display-drun = "";
          drun-display-format = "{name}";
          font = "${config.font.name} 9";
          fullscreen = mkLiteral "false";
          hide-scrollbar = mkLiteral "true";
          icon-theme = config.toolkits.gtk.iconTheme.name;
          show-icons = mkLiteral "true";
          sidebar-mode = mkLiteral "false";
        };

        "window" = {
          background-color = mkLiteral base00RGBA;
          border = mkLiteral "2px";
          border-color = mkLiteral "#${base0D}";
          border-radius = mkLiteral "16px";
          location = mkLiteral "center";
          text-color = mkLiteral "#${base06}";
          transparency = "real";
          width = mkLiteral "500px";
          x-offset = mkLiteral "0";
          y-offset = mkLiteral "0";
        };

        "prompt" = {
          background-color = mkLiteral "#${base01}";
          enabled = mkLiteral "true";
          font = "${config.font.name} 9";
          padding = mkLiteral "10px 15px 10px 15px";
          text-color = mkLiteral "#${base06}";
        };

        "entry" = {
          background-color = mkLiteral "#${base01}";
          blink = mkLiteral "true";
          expand = mkLiteral "true";
          horizontal-align = mkLiteral "0";
          margin = mkLiteral "0px";
          padding = mkLiteral "10px 15px 10px 7.5px";
          placeholder = "Search...";
          placeholder-color = mkLiteral "#${base04}";
          text-color = mkLiteral "#${base06}";
        };

        "inputbar" = {
          background-color = mkLiteral "#${base02}";
          border-radius = mkLiteral "0px";
          children = map mkLiteral ["prompt" "entry"];
          expand = mkLiteral "false";
          spacing = mkLiteral "0px";
          text-color = mkLiteral "#${base06}";
        };

        "listview" = {
          background-color = mkLiteral base00RGBA;
          cycle = mkLiteral "true";
          dynamic = mkLiteral "true";
          layout = mkLiteral "vertical";
          lines = mkLiteral "10";
          padding = mkLiteral "10px";
          spacing = mkLiteral "5px";
        };

        "mainbox" = {
          background-color = mkLiteral base00RGBA;
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
          text-color = mkLiteral "#${base06}";
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
          background-color = mkLiteral "#${base06}";
          border-radius = mkLiteral "10px";
          text-color = mkLiteral "#${base00}";
        };
      };
    };
  };
}
