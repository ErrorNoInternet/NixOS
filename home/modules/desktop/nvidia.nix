{
  config,
  lib,
  ...
}: let
  cfg = config.nvidia.desktopEntries;
  inherit (lib) mkEnableOption mkIf;
in {
  options.nvidia.desktopEntries.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    xdg.desktopEntries = {
      nvidia-supertuxkart = {
        name = "SuperTuxKart (nvidia-offload)";
        icon = "supertuxkart";
        categories = ["Game"];
        exec = "nvidia-offload supertuxkart";
      };

      nvidia-osu-lazer = {
        name = "osu! (nvidia-offload)";
        icon = "osu!";
        categories = ["Game"];
        exec = "nvidia-offload osu!";
      };
    };
  };
}
