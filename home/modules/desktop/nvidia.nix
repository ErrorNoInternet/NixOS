{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.nvidia.desktopEntries.enable = mkEnableOption "";

  config = mkIf config.nvidia.desktopEntries.enable {
    xdg.desktopEntries = {
      nvidia-supertuxkart = {
        name = "SuperTuxKart (nvidia-offload)";
        icon = "supertuxkart";
        categories = ["Game"];
        exec = "nvidia-offload supertuxkart";
      };
      nvidia-osu-lazer = {
        name = "osu! (nvidia-offload)";
        icon = "${inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin}/osu.png";
        categories = ["Game"];
        exec = "nvidia-offload osu-lazer";
      };
    };
  };
}
