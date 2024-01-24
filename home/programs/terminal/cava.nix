{
  config,
  lib,
  ...
}: let
  inherit
    (lib)
    mkEnableOption
    mkIf
    ;
in {
  options.home.programs.terminal.cava.enable = mkEnableOption "";

  config = mkIf config.home.programs.terminal.cava.enable {
    programs.cava = {
      enable = true;

      settings = {
        color = with config.colors.scheme.colors; {
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
