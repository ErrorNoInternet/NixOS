{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.server.programs.fish.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf config.server.programs.fish.enable {
    programs.fish.enable = true;
    environment.shells = [pkgs.fish];
    users.users.snowflake.shell = pkgs.fish;
  };
}
