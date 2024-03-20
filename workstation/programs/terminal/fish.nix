{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.workstation.programs.fish;
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.programs.fish.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
    programs.fish.enable = true;
    environment.shells = [pkgs.fish];
    users.users.error.shell = pkgs.fish;
  };
}
