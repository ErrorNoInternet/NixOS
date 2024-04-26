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

    commands = let
      bulkView = "-no-show-icons -theme-str 'window { width: 500px; } listview { lines: 15; }'";
    in {
      default = mkOption {
        type = types.str;
        default = "rofi -modes drun,window,run -show drun || pkill rofi";
      };

      clipboard = mkOption {
        type = types.str;
        default = "cliphist list | (rofi -dmenu -window-title cb ${bulkView} || pkill rofi) | cliphist decode";
      };

      emoji = mkOption {
        type = types.str;
        default = "rofi -show emoji ${bulkView} || pkill rofi";
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

          plugins = [rofi-emoji];
        };

      theme = with config.colors.scheme.palette; let
        raw = config.lib.formats.rasi.mkLiteral;

        base00RGBA = "rgba(${
          inputs.nix-colors.lib.conversions.hexToRGBString "," base00
        },${builtins.toString config.opacity.menu})";
      in {
        "*" = {
          background-color = raw base00RGBA;
          text-color = raw "#${base06}";
        };

        configuration = {
          disable-history = raw "false";
          display-drun = "";
          drun-display-format = "{name}";
          font = "${config.font.name} 9";
          fullscreen = raw "false";
          hide-scrollbar = raw "true";
          icon-theme = config.toolkits.gtk.iconTheme.name;
          show-icons = raw "true";
          sidebar-mode = raw "false";
        };

        window = {
          background-color = raw base00RGBA;
          border = raw "2px";
          border-color = raw "#${base0D}";
          border-radius = raw "16px";
          location = raw "center";
          text-color = raw "#${base06}";
          transparency = "real";
          width = raw "450px";
          x-offset = raw "0";
          y-offset = raw "0";
        };

        prompt = {
          background-color = raw "#${base01}";
          enabled = raw "true";
          font = "${config.font.name} 9";
          padding = raw "10px 15px 10px 15px";
          text-color = raw "#${base06}";
        };

        entry = {
          background-color = raw "#${base01}";
          blink = raw "true";
          expand = raw "true";
          horizontal-align = raw "0";
          margin = raw "0px";
          padding = raw "10px 15px 10px 7.5px";
          placeholder = "Search...";
          placeholder-color = raw "#${base04}";
          text-color = raw "#${base06}";
        };

        inputbar = {
          background-color = raw "#${base02}";
          border-radius = raw "0px";
          children = map raw ["prompt" "entry"];
          expand = raw "false";
          spacing = raw "0px";
          text-color = raw "#${base06}";
        };

        listview = {
          background-color = raw base00RGBA;
          cycle = raw "true";
          dynamic = raw "true";
          layout = raw "vertical";
          lines = raw "10";
          padding = raw "10px";
          spacing = raw "5px";
        };

        mainbox = {
          background-color = raw base00RGBA;
          border-radius = raw "0px";
          children = map raw ["inputbar" "listview"];
          padding = raw "0px";
          spacing = raw "0px";
        };

        element = {
          background-color = raw "transparent";
          border-radius = raw "10px";
          orientation = raw "horizontal";
          padding = raw "6px";
          text-color = raw "#${base06}";
        };

        element-icon = {
          background-color = raw "transparent";
          border = raw "0px";
          size = raw "24px";
          text-color = raw "inherit";
        };

        element-text = {
          background-color = raw "transparent";
          expand = raw "true";
          horizontal-align = raw "0";
          margin = raw "0px 2.5px 0px 2.5px";
          text-color = raw "inherit";
          vertical-align = raw "0.5";
        };

        "element selected" = {
          background-color = raw "#${base02}";
          border-radius = raw "10px";
        };
      };
    };
  };
}
