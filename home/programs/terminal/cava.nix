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
  options.customPrograms.terminal.cava.enable = mkEnableOption "";

  config = mkIf config.customPrograms.terminal.cava.enable {
    programs.cava = {
      enable = true;
      settings = {
        color = {
          gradient = 1;
          gradient_count = 4;
          gradient_color_1 = "'#${config.colorScheme.colors.base0F}'";
          gradient_color_2 = "'#${config.colorScheme.colors.base0D}'";
          gradient_color_3 = "'#${config.colorScheme.colors.base0C}'";
          gradient_color_4 = "'#${config.colorScheme.colors.base07}'";
        };
      };
    };
  };
}
