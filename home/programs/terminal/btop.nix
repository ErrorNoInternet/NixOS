{
  config,
  lib,
  pkgs,
  self,
  ...
}: {
  config = lib.mkIf config.home.programs.terminal.fish.enable {
    programs.btop = {
      enable = true;
      package = self.legacyPackages.${pkgs.system}.btop;

      settings = {
        color_theme = "${lib.strings.toLower config.colors.schemeName}";
        net_iface = "wlp5s0";
        nvml_measure_pcie_speeds = false;
        proc_sorting = "cpu direct";
        swap_disk = false;
        theme_background = false;
        update_ms = 1000;
        use_fstab = false;
      };
    };
  };
}
