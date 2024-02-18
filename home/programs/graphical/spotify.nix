{
  config,
  inputs',
  inputs,
  lib,
  ...
}: let
  cfg = config.home.programs.graphical.spotify;
  inherit (lib) mkEnableOption mkIf;

  spicePkgs = inputs'.spicetify-nix.packages.default;
in {
  imports = [inputs.spicetify-nix.homeManagerModule];

  options.home.programs.graphical.spotify.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    programs.spicetify = {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        fullAppDisplay
      ];

      theme = spicePkgs.themes.text;
      colorScheme = "Nord";
    };
  };
}
