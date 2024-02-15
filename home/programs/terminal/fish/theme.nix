{
  lib,
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
    interactiveShellInit = ''
      if not set -q THEME_CONFIGURED
        set -U THEME_CONFIGURED 1

        set -Ux MANPAGER "sh -c 'col -bx | ${lib.getExe pkgs.bat} -l man -p'"
        set -Ux MANROFFOPT "-c"

        set -U fish_greeting
        set -U fish_cursor_default line
        set -U fish_color_autosuggestion brblack

        tide configure --auto \
          --style=Lean \
          --prompt_colors='16 colors' \
          --show_time='24-hour format' \
          --lean_prompt_height='One line' \
          --prompt_spacing=Sparse \
          --icons='Few icons' \
          --transient=No

        set -U tide_color_truncated_dirs blue
        set -U tide_pwd_color_truncated_dirs blue
        set -U tide_pwd_color_dirs blue
        set -U tide_pwd_color_anchors blue
        set -U tide_character_color cyan
        set -U tide_time_color cyan

        tide reload
      end
    '';
  };
}
