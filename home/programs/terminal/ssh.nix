{
  config,
  lib,
  ...
}: let
  cfg = config.customPrograms.terminal.ssh;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.terminal.ssh.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent =
        if config.flags.nixOnDroid
        then "6h"
        else "1d";
    };
    services.ssh-agent.enable = true;
  };
}
