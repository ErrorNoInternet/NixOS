{pkgs, ...}: {
  programs.fish = {
    plugins = with pkgs.fishPlugins; [
      {
        name = "tide";
        inherit (tide) src;
      }
    ];
    shellInit = ''
      set -U fish_greeting
    '';
    interactiveShellInit = ''
      if not set -q TIDE_CONFIGURED
        tide configure --auto \
          --style=Lean \
          --prompt_colors='16 colors' \
          --show_time='24-hour format' \
          --lean_prompt_height='One line' \
          --prompt_spacing=Sparse \
          --icons='Few icons' \
          --transient=No

        set -U TIDE_CONFIGURED 1
      end

      set fish_cursor_default line
      set fish_color_autosuggestion brblack

      set tide_color_truncated_dirs blue
      set tide_pwd_color_truncated_dirs blue
      set tide_pwd_color_dirs blue
      set tide_pwd_color_anchors blue
      set tide_character_color cyan
      set tide_time_color cyan
    '';
  };
}
