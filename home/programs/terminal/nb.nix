{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.nb;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.customPrograms.nb = {
    enable = mkEnableOption "";

    dataDirectory = mkOption {
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    home = {
      file.".nbrc".text = ''
        #!/usr/bin/env bash

        export NB_AUTO_SYNC="''${NB_AUTO_SYNC:-0}"
        export NB_COLOR_PRIMARY=7
        export NB_COLOR_SECONDARY=4
        export NB_DIR="''${NB_DIR:-${cfg.dataDirectory}}"
      '';
      packages = [pkgs.nb];
    };
  };
}
