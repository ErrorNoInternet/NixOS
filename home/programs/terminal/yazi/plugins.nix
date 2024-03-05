{ config, self', ... }:
let
  pluginsPath = "${config.xdg.configHome}/yazi/plugins";
in
{
  home.file = with self'.packages; {
    "${pluginsPath}/keyjump.yazi".source = yazi-plugin-keyjump;
    "${pluginsPath}/bookmarks.yazi".source = yazi-plugin-bookmarks;
  };
}
