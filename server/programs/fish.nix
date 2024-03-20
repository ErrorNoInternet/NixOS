{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.server.programs.fish;
  inherit (lib) mkEnableOption mkIf;
in {
  options.server.programs.fish.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
    programs.fish.enable = true;
    environment.shells = [pkgs.fish];
    users.users.snowflake.shell = pkgs.fish;
  };
}
