{
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    plugins = with pkgs.fishPlugins; [
      {
        name = "tide";
        inherit (tide) src;
      }
    ];
    interactiveShellInit = with config.colors.scheme.palette; ''
      if not set -q THEME_CONFIGURED
        set -U THEME_CONFIGURED 1

        set -Ux MANPAGER "less -R --use-color -Dd+c -Du+b"
        set -Ux MANROFFOPT "-c"

        set -U fish_greeting
        set -U fish_color_autosuggestion brblack

        tide configure --auto \
          --style=Lean \
          --prompt_colors='16 colors' \
          --show_time='24-hour format' \
          --lean_prompt_height='One line' \
          --prompt_spacing=Sparse \
          --icons='Few icons' \
          --transient=No

        set -U tide_character_color cyan
        set -U tide_color_truncated_dirs blue
        set -U tide_pwd_color_anchors blue
        set -U tide_pwd_color_dirs blue
        set -U tide_pwd_color_truncated_dirs blue
        set -U tide_right_prompt_items status cmd_duration context jobs direnv \
                                       node python rustc java php ruby go \
                                       distrobox toolbox nix_shell zig
        set -U tide_time_color cyan

        tide reload
      end

      function set_tty_theme -d "apply theme to TTY"
        argparse "r/reset" -- $argv

        if set -q _flag_reset
          reset
        else
          echo -e "
            \e]P0${base00}
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
            \e[16;1000]
          "
        end

        clear
      end
    '';
  };
}
