{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.home.programs.terminal;
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [
    ./abbreviations
    ./aliases.nix
    ./functions.nix
    ./keybinds.nix
    ./theme.nix
  ];

  options.home.programs.terminal.fish.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf (cfg.fish.enable
    || cfg.foot.enable
    || cfg.wezterm.enable
    || cfg.kitty.enable) {
    programs.fish = {
      enable = true;
      plugins = with pkgs.fishPlugins; [
        {
          name = "autopair";
          inherit (autopair) src;
        }
      ];
      interactiveShellInit = with config.colors.scheme.palette; ''
        set -x _ZO_MAXAGE 20000
        set -x _ZO_RESOLVE_SYMLINKS 1

        if not set -q TTY_COLORS_SET; and test "$TERM" = "linux"
          echo -e "
          \e]P0${base01}
          \e]P1${base08}
          \e]P2${base0B}
          \e]P3${base0A}
          \e]P4${base0D}
          \e]P5${base0E}
          \e]P6${base0C}
          \e]P7${base05}
          \e]P8${base03}
          \e]P9${base08}
          \e]PA${base0B}
          \e]PB${base0A}
          \e]PC${base0D}
          \e]PD${base0E}
          \e]PE${base07}
          \e]PF${base06}
          "

          set -x TTY_COLORS_SET 1
          clear
        end

        if test $SHLVL -le 2
          if test -e /android/system/bin/linker64
            mfd
          else
            if test (tmux list-windows 2> /dev/null | count) -le 1
              if test (tmux list-panes 2> /dev/null | count) -le 1
                mf
              end
            end
          end
        end
      '';
    };
  };
}
