{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.profiles.desktop.enable {
    programs.wezterm = {
      enable = true;
      package = inputs.wezterm.packages.${pkgs.system}.default;

      extraConfig = ''
        local wezterm = require 'wezterm'

        local config = {}
        if wezterm.config_builder then
          config = wezterm.config_builder()
        end
        config = {
          check_for_updates = false,
          default_prog = { "/etc/profiles/per-user/error/bin/tmux" },

          color_scheme = "nord",
          font_size = 9,
          default_cursor_style = "SteadyBar",

          window_background_opacity = ${builtins.toString config.opacity.normal},
          window_padding = {
            left = 1,
            right = 1,
            top = 1,
            bottom = 0,
          },
          enable_tab_bar = false,
        }

        return config
      '';
    };
  };
}
