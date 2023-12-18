{
  inputs,
  pkgs,
  ...
}: {
  xdg.desktopEntries = {
    supertuxkart = {
      name = "SuperTuxKart";
      icon = "supertuxkart";
      exec = "nvidia-offload supertuxkart";
    };
    osu-lazer = {
      name = "osu! (nvidia-offload)";
      icon = "${inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin}/osu.png";
      exec = "nvidia-offload osu-lazer";
    };
  };
}
