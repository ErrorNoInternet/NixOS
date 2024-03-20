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
      packages = with pkgs;
        map (variation: (writeScriptBin variation ''
          #!/usr/bin/env bash
          export PATH=${nix}/bin:$PATH
          ${fastfetch}/bin/${variation} "$@"
        ''))
        ["fastfetch" "flashfetch"];

      file = let
        escape = string: builtins.replaceStrings ["\\\\"] ["\\"] string;
      in {
        "${config.xdg.configHome}/fastfetch/minimal.jsonc".text = escape (import ./minimal.nix {inherit pkgs;});
        "${config.xdg.configHome}/fastfetch/minimal-droid.jsonc".text = escape (import ./minimal-droid.nix {inherit pkgs;});

        "${config.xdg.configHome}/fastfetch/config.jsonc".text = builtins.toJSON {
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
              folders = "/";
            }
            "break"
            "colors"
          ];
        };
      };
    };
  };
}
