{ inputs, pkgs, ... }:

let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  imports = [ inputs.spicetify-nix.homeManagerModule ];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Nord;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      fullAppDisplay
    ];
  };
}
