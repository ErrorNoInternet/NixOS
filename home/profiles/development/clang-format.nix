{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.development.clangFormat.enable =
    mkEnableOption ""
    // {
      default = config.profiles.development.enable;
    };

  config = mkIf config.profiles.development.clangFormat.enable {
    home.file.".clang-format".text = ''
      BasedOnStyle: LLVM
      IndentWidth: 4
    '';
  };
}
