{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.fastfetch;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.fastfetch.enable =
    mkEnableOption "" // {default = config.customPrograms.fish.enable;};

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs;
        map (variation: (writeScriptBin variation ''
          export PATH=$PATH:${nix}/bin
          ${fastfetch}/bin/${variation} "$@"
        ''))
        ["fastfetch" "flashfetch"];

      file = let
        escape = string: builtins.replaceStrings ["\\\\"] ["\\"] string;
      in {
        "${config.xdg.configHome}/fastfetch/minimal.jsonc".text = escape (import ./minimal.nix {inherit pkgs;});
        "${config.xdg.configHome}/fastfetch/minimal-droid.jsonc".text = escape (import ./minimal-droid.nix {inherit pkgs;});

        "${config.xdg.configHome}/fastfetch/config.jsonc".text = builtins.toJSON {
          general.processingTimeout = 10000;
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
