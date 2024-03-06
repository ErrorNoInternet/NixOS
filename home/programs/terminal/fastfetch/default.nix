{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.terminal.fastfetch;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.terminal.fastfetch.enable =
    mkEnableOption "" // {default = config.customPrograms.terminal.fish.enable;};

  config = mkIf cfg.enable {
    home = {
      packages = [pkgs.fastfetch];

      file = let
        escape = string: builtins.replaceStrings ["\\\\"] ["\\"] string;
      in {
        "${config.xdg.configHome}/fastfetch/minimal.jsonc".text = escape (import ./minimal.nix {inherit pkgs;});
        "${config.xdg.configHome}/fastfetch/minimal-droid.jsonc".text = escape (import ./minimal-droid.nix {inherit pkgs;});

        "${config.xdg.configHome}/fastfetch/config.jsonc".text = builtins.toJSON {
          "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
          modules = [
            "title"
            "separator"
            "os"
            "kernel"
            "uptime"
            "packages"
            "shell"
            "display"
            "wm"
            "theme"
            "icons"
            "cursor"
            "terminalfont"
            "terminal"
            "processes"
            "memory"
            {
              type = "disk";
              folders = "/nix";
            }
            "break"
            "colors"
          ];
        };
      };
    };
  };
}
