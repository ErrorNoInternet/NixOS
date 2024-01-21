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
        local config = {}
        if wezterm.config_builder then
          config = wezterm.config_builder()
        end

        wezterm.on("window-resized", function(window, pane)
          local window_dims = window:get_dimensions();
          local overrides = window:get_config_overrides() or {}
          local new_padding = {
            left = math.floor((window_dims.pixel_width % 18) / 2),
            right = 0,
            top = math.floor((window_dims.pixel_height % 28) / 2),
            bottom = 0
          };
          overrides.window_padding = new_padding
          window:set_config_overrides(overrides)
        end);

        config = {
          check_for_updates = false,
          default_prog = { "/etc/profiles/per-user/error/bin/tmux" },

          color_scheme = "nord",
          font_size = 9,
          default_cursor_style = "SteadyBar",

          window_background_opacity = ${builtins.toString config.opacity.normal},
          enable_tab_bar = false,

          keys = {
            { key = "T", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
          },
        }

        return config
      '';
    };
  };
}
