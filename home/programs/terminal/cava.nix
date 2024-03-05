{ config, lib, ... }:
let
  cfg = config.customPrograms.terminal.cava;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.customPrograms.terminal.cava.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    programs.cava = {
      enable = true;

      settings = {
        color = with config.colors.scheme.palette; {
          gradient = 1;
          gradient_count = 4;
          gradient_color_1 = "'#${base0F}'";
          gradient_color_2 = "'#${base0D}'";
          gradient_color_3 = "'#${base0C}'";
          gradient_color_4 = "'#${base07}'";
        };
      };
    };
  };
}
