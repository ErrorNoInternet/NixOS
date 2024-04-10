{pkgs, ...}: let
  plugins = with pkgs; [
    {
      name = "keyjump.yazi";
      src = yaziPlugin-keyjump;
    }
    {
      name = "bookmarks.yazi";
      src = yaziPlugin-bookmarks;
    }
  ];
in {
  xdg.configFile = builtins.listToAttrs (map (plugin: {
      name = "yazi/plugins/${plugin.name}";
      value.source = plugin.src;
    })
    plugins);
}
