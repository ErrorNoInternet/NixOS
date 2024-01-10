{
  config,
  inputs,
  lib,
  ...
}: {
  imports = [inputs.nix-index-database.hmModules.nix-index];

  config = lib.mkIf config.home.programs.terminal.fish.enable {
    programs.nix-index-database.comma.enable = true;
  };
}
