{ config, custom, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "${custom.font}";
      size = 9.5;
    };
    settings = {
      background_opacity = custom.opacity;
      cursor_shape = "beam";
      enable_audio_bell = false;
      shell = "tmux";
    };
    shellIntegration.enableZshIntegration = true;
    keybindings = {
      "ctrl+shift+left" = "send_text all \\x1b\\x5b\\x31\\x3b\\x33\\x44";
      "ctrl+shift+right" = "send_text all \\x1b\\x5b\\x31\\x3b\\x33\\x43";
    };
    extraConfig = ''
      foreground            #${config.colorScheme.colors.base04}
      background            #${config.colorScheme.colors.base00}
      selection_foreground  #000000
      selection_background  #${config.colorScheme.colors.base0A}
      url_color             #0087BD
      cursor                #${config.colorScheme.colors.base0D}

      color0   #${config.colorScheme.colors.base01}
      color8   #${config.colorScheme.colors.base03}
      color1   #${config.colorScheme.colors.base08}
      color9   #${config.colorScheme.colors.base08}
      color2   #${config.colorScheme.colors.base0B}
      color10  #${config.colorScheme.colors.base0B}
      color3   #${config.colorScheme.colors.base0A}
      color11  #${config.colorScheme.colors.base0A}
      color4   #${config.colorScheme.colors.base0D}
      color12  #${config.colorScheme.colors.base0D}
      color5   #${config.colorScheme.colors.base0E}
      color13  #${config.colorScheme.colors.base0E}
      color6   #${config.colorScheme.colors.base0C}
      color14  #${config.colorScheme.colors.base07}
      color7   #${config.colorScheme.colors.base05}
      color15  #${config.colorScheme.colors.base06}
    '';
  };
}
