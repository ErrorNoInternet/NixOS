{
  config,
  pkgs,
  ...
}: let
  pluginsPath = "${config.xdg.configHome}/yazi/plugins";
in {
  home.file = {
    "${pluginsPath}/keyjump.yazi".source = pkgs.fetchFromGitHub {
      owner = "DreamMaoMao";
      repo = "keyjump.yazi";
      rev = "478b2b5014dd89c99eb19b6d8d9273ee4620d3d2";
      hash = "sha256-ilEnjd066Zk2RDoOCBZcz4zbnyC90q67+W2zHy8hcPo=";
    };

    "${pluginsPath}/bookmarks.yazi".source = pkgs.fetchFromGitHub {
      owner = "dedukun";
      repo = "bookmarks.yazi";
      rev = "26a5512316594c5d44035280cf53fd8103c77959";
      hash = "sha256-fL4g8pP30HMMguYXEt6CpATLiybkzwIk9iKnQ2BBGFE=";
    };
  };
}
