{
  config,
  lib,
  ...
}: let
  cfg = config.customPrograms.btop;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.customPrograms.btop = {
    enable = mkEnableOption "" // {default = config.customPrograms.fish.enable;};

    net_iface = mkOption {
      type = types.str;
      default = "wlp5s0";
    };
  };

  config = mkIf cfg.enable {
    programs.btop = {
      enable = true;
      settings = {
        inherit (cfg) net_iface;
        color_theme = lib.strings.toLower config.colors.schemeName;
        proc_gradient = false;
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
