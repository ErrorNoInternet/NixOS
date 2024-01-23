{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [
    ./abbreviations
    ./aliases.nix
    ./functions.nix
    ./keymaps.nix
    ./visual.nix
  ];

  options.home.programs.terminal.fish.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf (config.home.programs.terminal.fish.enable
    || config.home.programs.terminal.foot.enable
    || config.home.programs.terminal.wezterm.enable) {
    programs.fish = {
      enable = true;
      plugins = with pkgs.fishPlugins; [
        {
          name = "autopair";
          inherit (autopair) src;
        }
      ];
      interactiveShellInit = ''
        set -x _ZO_MAXAGE 20000
        set -x _ZO_RESOLVE_SYMLINKS 1

        if test (ps | grep fish | wc -l) -le 1
          if test -e /android/system/bin/linker64
            mfd
          else
            if test (tmux list-windows 2> /dev/null | wc -l) -le 1 &&
               test (tmux list-panes 2> /dev/null | wc -l) -le 1
              mf
            end
          end
        end

        echo -en "\x1b[\x35 q"
      '';
    };
  };
}
