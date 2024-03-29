{config, ...}: let
  pluginsPath = "yazi/plugins";
in {
  xdg.configFile = with config.pkgsSelf; {
    "${pluginsPath}/keyjump.yazi".source = yaziPlugin-keyjump;
    "${pluginsPath}/bookmarks.yazi".source = yaziPlugin-bookmarks;
  };
}
