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

  options.home.programs.graphical.spotify.enable = mkEnableOption "";

  config = mkIf config.home.programs.graphical.spotify.enable {
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
