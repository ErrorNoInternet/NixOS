{self', ...}: let
  pluginsPath = "yazi/plugins";
in {
  xdg.configFile = with self'.packages; {
    "${pluginsPath}/keyjump.yazi".source = yaziPlugin-keyjump;
    "${pluginsPath}/bookmarks.yazi".source = yaziPlugin-bookmarks;
  };
}
