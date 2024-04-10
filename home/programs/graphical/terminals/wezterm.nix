{
  config,
  lib,
  ...
}: let
  cfg = config.customPrograms.wezterm;
  inherit (lib) mkOption mkIf types;
in {
  options.customPrograms.wezterm = {
    font = mkOption {
      default = config.font.name;
      type = types.str;
    };

    colorScheme = mkOption {
      default = config.colors.schemeName;
      type = types.str;
    };

    backgroundOpacity = mkOption {
      default = config.opacity.normal;
      type = types.numbers.between 0 1;
    };
  };

  config = mkIf config.profiles.desktop.enable {
    programs.wezterm = {
      enable = true;
      package = config.pkgsSelf.wezterm;

      extraConfig = ''
        local config = {}
        if wezterm.config_builder then
          config = wezterm.config_builder()
        end

        config = {
          check_for_updates = false,
          automatically_reload_config = false,
          default_prog = { "/etc/profiles/per-user/error/bin/tmux" },

          font = wezterm.font "${cfg.font}",
          font_size = 9,
          color_scheme = "${cfg.colorScheme} (base16)",
          warn_about_missing_glyphs = false,

          initial_cols = 268,
          initial_rows = 64,
          window_padding = {
            top = "0.5cell",
            bottom = "0.25cell",
            left = "1cell",
            right = "1cell",
          },
          window_background_opacity = ${builtins.toString cfg.backgroundOpacity},

          hide_tab_bar_if_only_one_tab = true,
          show_new_tab_button_in_tab_bar = false,
          show_tab_index_in_tab_bar = false,
          tab_bar_at_bottom = true,
          use_fancy_tab_bar = false,
        }

        for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
          if gpu.backend == 'Gl' and gpu.device_type == 'IntegratedGpu' then
            config.webgpu_preferred_adapter = gpu
            config.front_end = 'WebGpu'
            break
          end
        end

        return config
      '';
    };
  };
}
