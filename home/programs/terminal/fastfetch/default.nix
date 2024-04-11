{
  config,
  lib,
  pkgs,
  ...
} @ args: let
  cfg = config.customPrograms.fastfetch;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.fastfetch.enable =
    mkEnableOption "" // {default = config.customPrograms.fish.enable;};

  config = mkIf cfg.enable {
    home.packages = [pkgs.fastfetch];

    xdg.configFile = let
      escape = string: builtins.replaceStrings ["\\\\"] ["\\"] string;
    in {
      "fastfetch/minimal.jsonc".text = escape (import ./minimal.nix args);
      "fastfetch/minimal-droid.jsonc".text = escape (import ./minimal-droid.nix args);
      "fastfetch/config.jsonc".text = builtins.toJSON {
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
}
