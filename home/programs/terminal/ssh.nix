{
  config,
  lib,
  ...
}: let
  cfg = config.home.programs.terminal.ssh;
  inherit (lib) mkEnableOption mkIf;
in {
  options.home.programs.terminal.ssh.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "1d";
    };
    services.ssh-agent.enable = true;
  };
}