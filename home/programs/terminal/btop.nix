{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.home.programs.terminal.fish.enable {
    programs.btop = {
      enable = true;

      settings = {
        color_theme = "TTY";
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
