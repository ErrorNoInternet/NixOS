{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  cfg = config.home.programs.terminal.wezterm;
  inherit (lib) mkOption mkIf types;
in {
  options.home.programs.terminal.wezterm.color_scheme = mkOption {
    default = "Nord (base16)";
    type = types.str;
  };

  config = mkIf config.profiles.desktop.enable {
    programs.wezterm = with config.colorScheme.colors; {
      enable = true;
      package = self.legacyPackages.${pkgs.system}.wezterm;

      extraConfig = ''
        local config = {}
        if wezterm.config_builder then
          config = wezterm.config_builder()
        end

        wezterm.on("window-resized", function(window, _)
          local window_dims = window:get_dimensions();
          local overrides = window:get_config_overrides() or {}
          local new_padding = {
            left = math.floor((window_dims.pixel_width % 7) / 2),
            right = 0,
            top = math.floor(window_dims.pixel_height % 16) - 3,
            bottom = 0,
          };
          overrides.window_padding = new_padding
          window:set_config_overrides(overrides)
        end);

        local custom_color_scheme = wezterm.color.get_builtin_schemes()["${cfg.color_scheme}"];
        custom_color_scheme.cursor_border = "#${base01}";

        config = {
          check_for_updates = false,
          default_prog = { "/etc/profiles/per-user/error/bin/tmux" },

          font = wezterm.font "JetBrainsMono Nerd Font",
          font_size = 9,
          default_cursor_style = "SteadyBar",

          color_scheme = "${cfg.color_scheme}",
          color_schemes = {
            ["${cfg.color_scheme}"] = custom_color_scheme,
          },

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
