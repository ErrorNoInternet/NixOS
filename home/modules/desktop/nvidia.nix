{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  options = {
    nvidia = {
      desktopEntries = {
        enable = lib.mkEnableOption "";
      };
    };
  };

  config = lib.mkIf config.nvidia.desktopEntries.enable {
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
