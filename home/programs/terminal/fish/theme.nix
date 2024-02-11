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
