{
  config,
  lib,
  ...
}: let
  cfg = config.profiles.development.clangFormat;
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.development.clangFormat.enable =
    mkEnableOption "" // {default = config.profiles.development.enable;};

  config = mkIf cfg.enable {
    home.file.".clang-format".text = ''
      BasedOnStyle: LLVM
      IndentWidth: 4
    '';
  };
}
