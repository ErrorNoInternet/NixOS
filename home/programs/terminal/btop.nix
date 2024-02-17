{
  config,
  lib,
  self',
  ...
}: let
  cfg = config.home.programs.terminal.btop;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.home.programs.terminal.btop = {
    enable =
      mkEnableOption ""
      // {
        default = config.home.programs.terminal.fish.enable;
      };

    theme = {
      name = mkOption {
        default = "catppuccin_mocha";
        type = types.str;
      };

      package = mkOption {
        default = self'.packages.btop-theme-catppuccin;
        type = types.package;
      };
    };
  };

  config = mkIf cfg.enable {
    home.file."${config.xdg.configHome}/btop/themes".source = "${cfg.theme.package}/themes";

    programs.btop = {
      enable = true;
      settings = {
        color_theme = cfg.theme.name;
        net_iface = "wlp5s0";
        proc_sorting = "cpu direct";
        show_gpu_info = "Off";
        swap_disk = false;
        theme_background = false;
        update_ms = 1000;
        use_fstab = false;
        vim_keys = true;
      };
    };
  };
}
