{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.development.clangd.enable =
    mkEnableOption ""
    // {
      default = config.profiles.development.enable;
    };

  config = mkIf config.profiles.development.clangd.enable {
    home.file.".clangd".text = ''
      CompileFlags:
        Add: [
          -std=c++20,
          -Wall,

          -DWLR_USE_UNSTABLE=1,
        ]
    '';
  };
}
