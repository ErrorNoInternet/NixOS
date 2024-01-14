{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.workstation.programs.fish.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf config.workstation.programs.fish.enable {
    programs.fish.enable = true;
    environment.shells = [pkgs.fish];
    users.users.error.shell = pkgs.fish;
  };
}
