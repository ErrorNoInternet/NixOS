{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.development.clang-format.enable =
    mkEnableOption ""
    // {
      default = config.profiles.development.enable;
    };

  config = mkIf config.profiles.development.clang-format.enable {
    home.file.".clang-format".text = ''
      BasedOnStyle: LLVM
      IndentWidth: 4
    '';
  };
}
