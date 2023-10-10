{ custom, lib, ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "${lib.strings.toLower custom.predefinedColorScheme}";
      theme_background = false;
      update_ms = 1000;
      swap_disk = false;
      net_iface = "wlp5s0";
      proc_sorting = "cpu direct";
    };
  };
}
