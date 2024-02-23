{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.graphical.kdeconnect;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.customPrograms.graphical.kdeconnect = {
    enable = mkEnableOption "";

    enableYaziIntegration =
      mkEnableOption ""
      // {
        default = true;
      };

    deviceId = mkOption {
      default = "6ded058eb2e79440";
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    services.kdeconnect.enable = true;
    home.file."${config.xdg.configHome}/kdeconnect/${cfg.deviceId}/kdeconnect_runcommand/config".text = ''
      [General]
      commands="@ByteArray({\"_06229304_9fe8_440b_b731_d27b1602cbd0_\":{\"command\":\"hyprctl dispatch dpms off\",\"name\":\"DPMS Off\"},\"_2d7befd0_a3dc_43fa_b482_3becdf6902b8_\":{\"command\":\"hyprctl dispatch workspace previous\",\"name\":\"Workspace Previous\"},\"_2db836a0_3802_4a5d_9771_b951a085ee3d_\":{\"command\":\"hyprctl dispatch workspace +1\",\"name\":\"Workspace +1\"},\"_4651899c_1012_4fc9_8484_0e095fcc214b_\":{\"command\":\"swaylock --grace 0 --fade-in 1\",\"name\":\"Lock Screen\"},\"_a33de15f_5418_46da_86a5_06f4c9943b07_\":{\"command\":\"hyprctl dispatch killactive\",\"name\":\"Kill Active\"},\"_af876aa7_0496_4823_840d_7cc8ca74c0a8_\":{\"command\":\"hyprctl dispatch workspace -1\",\"name\":\"Workspace -1\"},\"_fb99f80b_7a0d_43c5_baa5_7bc309867148_\":{\"command\":\"hyprctl dispatch dpms on\",\"name\":\"DPMS On\"}})"
    '';

    programs.yazi.keymap.manager.keymap = mkIf cfg.enableYaziIntegration [
      {
        on = ["E"];
        exec = "shell --block '${pkgs.kdeconnect}/bin/kdeconnect-cli -d ${cfg.deviceId} --share \"$@\"; read'";
        desc = "send file to ${cfg.deviceId} using KDE Connect";
      }
    ];
  };
}
