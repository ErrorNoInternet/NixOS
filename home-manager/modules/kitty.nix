{ custom }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "${custom.font}";
      size = 9.5;
    };
    theme = "Nord";
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
  };
}
