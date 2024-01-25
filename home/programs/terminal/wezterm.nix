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
    default = "nord";
    type = types.str;
  };

  config = mkIf config.profiles.desktop.enable {
    programs.wezterm = {
      enable = true;
      package = self.legacyPackages.${pkgs.system}.wezterm;

      extraConfig = ''
        local config = {}
        if wezterm.config_builder then
          config = wezterm.config_builder()
        end

        config = {
          check_for_updates = false,
          automatically_reload_config = false,
          default_prog = { "/etc/profiles/per-user/error/bin/tmux" },

          font = wezterm.font "JetBrainsMono Nerd Font",
          font_size = 9,
          default_cursor_style = "SteadyBar",
          color_scheme = "${cfg.color_scheme}",

          window_padding = {
            top = "0.5cell",
            bottom = 0,
            left = "1cell",
            right = "1cell",
          },
          window_background_opacity = ${builtins.toString config.opacity.normal},
          enable_tab_bar = false,

          keys = {
            { key = "T", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
          },
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
