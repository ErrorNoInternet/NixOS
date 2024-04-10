{pkgs, ...}: let
  pluginsPath = "yazi/plugins";
in {
  xdg.configFile = with pkgs; {
    "${pluginsPath}/keyjump.yazi".source = yaziPlugin-keyjump;
    "${pluginsPath}/bookmarks.yazi".source = yaziPlugin-bookmarks;
  };
}
