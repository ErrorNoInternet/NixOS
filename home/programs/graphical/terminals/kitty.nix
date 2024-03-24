{
  config,
  inputs,
  lib,
  self',
  ...
}: let
  cfg = config.customPrograms.graphical.kitty;
  inherit (lib) mkEnableOption mkOption mkIf types intersperse;
in {
  options.customPrograms.graphical.kitty = {
    enable = mkEnableOption "" // {default = config.profiles.desktop.enable;};

    monitor = {
      height = mkOption {
        type = types.int;
        default = 1022;
      };

      width = mkOption {
        type = types.int;
        default = 1896;
      };
    };
  };

  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      package = self'.packages.kitty;
      shellIntegration.mode = "no-cursor";

      font = {
        inherit (config.font) name;
        size = 9;
      };

      settings = {
        confirm_os_window_close = 0;
        enable_audio_bell = false;
        shell = "tmux";

        background_opacity = builtins.toString config.opacity.normal;
        initial_window_height = cfg.monitor.height;
        initial_window_width = cfg.monitor.width;
        remember_window_size = "no";
        resize_debounce_time = "0 0";
        window_padding_width = 5;

        box_drawing_scale = "0.001, 0.75, 1, 1.5";
        modify_font = "baseline 1";
        symbol_map = "U+23CE,U+25CB ${config.font.name}";
      };

      keybindings = {
        "ctrl+shift+left" = "send_text all \\x1b\\x5b\\x31\\x3b\\x33\\x44";
        "ctrl+shift+right" = "send_text all \\x1b\\x5b\\x31\\x3b\\x33\\x43";
      };

      extraConfig = with config.colors.scheme.palette; let
        base00Variation =
          builtins.replaceStrings [" "] [""]
          (builtins.toString (intersperse ","
              (map (c: c - 1) (inputs.nix-colors.lib.conversions.hexToRGB base00))));
      in ''
        background            base10_rgb:${base00Variation}
        cursor                #${base04}
        foreground            #${base04}
        selection_background  #${base0A}
        selection_foreground  #${base00}
        url_color             #${base07}

        color0                #${base01}
        color8                #${base03}
        color1                #${base08}
        color9                #${base08}
        color2                #${base0B}
        color10               #${base0B}
        color3                #${base0A}
        color11               #${base0A}
        color4                #${base0D}
        color12               #${base0D}
        color5                #${base0E}
        color13               #${base0E}
        color6                #${base0C}
        color14               #${base07}
        color7                #${base05}
        color15               #${base06}
      '';
    };
  };
}
