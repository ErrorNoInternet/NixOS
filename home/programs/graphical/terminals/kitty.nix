{
  config,
  inputs,
  lib,
  self',
  ...
}: {
  config = lib.mkIf config.profiles.desktop.enable {
    programs.kitty = {
      enable = true;
      package = self'.packages.kitty;
      shellIntegration.enableFishIntegration = true;

      font = {
        inherit (config.font) name;
        size = 9;
      };
      settings = {
        background_opacity = "${builtins.toString config.opacity.normal}";
        box_drawing_scale = "0.001, 0.75, 1, 1.5";
        confirm_os_window_close = 0;
        enable_audio_bell = false;
        modify_font = "baseline 1";
        shell = "tmux";
        window_padding_width = 5;
      };
      keybindings = {
        "ctrl+shift+left" = "send_text all \\x1b\\x5b\\x31\\x3b\\x33\\x44";
        "ctrl+shift+right" = "send_text all \\x1b\\x5b\\x31\\x3b\\x33\\x43";
      };
      extraConfig = with config.colors.scheme.palette; let
        base00Variation = "${
          builtins.replaceStrings [" "] [""]
          (builtins.toString (lib.intersperse
              "," (map (v: v - 1) (inputs.nix-colors.lib.conversions.hexToRGB base00))))
        }";
      in ''
        background            real_rgb:${base00Variation}
        cursor                #${base04}
        foreground            #${base04}
        selection_background  #${base0A}
        selection_foreground  #${base00}
        url_color             #${base07}

        color0   #${base01}
        color8   #${base03}
        color1   #${base08}
        color9   #${base08}
        color2   #${base0B}
        color10  #${base0B}
        color3   #${base0A}
        color11  #${base0A}
        color4   #${base0D}
        color12  #${base0D}
        color5   #${base0E}
        color13  #${base0E}
        color6   #${base0C}
        color14  #${base07}
        color7   #${base05}
        color15  #${base06}
      '';
    };
  };
}