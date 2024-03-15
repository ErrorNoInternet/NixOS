{
  config,
  self',
  ...
}: let
  pluginsPath = "${config.xdg.configHome}/yazi/plugins";
in {
  home.file = with self'.packages; {
    "${pluginsPath}/keyjump.yazi".source = yaziPlugin-keyjump;
    "${pluginsPath}/bookmarks.yazi".source = yaziPlugin-bookmarks;
  };
}
