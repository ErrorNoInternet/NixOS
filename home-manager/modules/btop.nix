{
  custom,
  lib,
  ...
}: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "${lib.strings.toLower custom.predefinedColorScheme}";
      net_iface = "wlp5s0";
      proc_sorting = "cpu direct";
      swap_disk = false;
      theme_background = false;
      update_ms = 1000;
      use_fstab = false;
    };
  };
}
