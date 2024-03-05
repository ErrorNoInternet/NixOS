{ config, lib, ... }:
let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.profiles.development.clangd.enable = mkEnableOption "" // {
    default = config.profiles.development.enable;
  };

  config = mkIf config.profiles.development.clangd.enable {
    home.file."${config.xdg.configHome}/clangd/config.yaml".text = ''
      CompileFlags:
        Add: [
          -Wall,
        ]
    '';
  };
}
