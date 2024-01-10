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
      supertuxkart = {
        name = "SuperTuxKart (nvidia-offload)";
        icon = "supertuxkart";
        exec = "nvidia-offload supertuxkart";
      };
      osu-lazer = {
        name = "osu! (nvidia-offload)";
        icon = "${inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin}/osu.png";
        exec = "nvidia-offload osu!";
      };
    };
  };
}
