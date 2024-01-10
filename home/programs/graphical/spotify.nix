{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  imports = [inputs.spicetify-nix.homeManagerModule];

  options.customPrograms.graphical.spotify.enable = mkEnableOption "";

  config = mkIf config.customPrograms.graphical.spotify.enable {
    programs.spicetify = {
      enable = true;
      theme = spicePkgs.themes.Nord;

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        fullAppDisplay
      ];
    };
  };
}
