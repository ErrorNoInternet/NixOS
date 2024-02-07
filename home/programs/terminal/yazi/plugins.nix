{
  config,
  pkgs,
  ...
}: let
  pluginsPath = "${config.xdg.configHome}/yazi/plugins";
in {
  home.file."${pluginsPath}/keyjump.yazi".source = pkgs.fetchFromGitHub {
    owner = "DreamMaoMao";
    repo = "keyjump.yazi";
    rev = "478b2b5014dd89c99eb19b6d8d9273ee4620d3d2";
    hash = "sha256-ilEnjd066Zk2RDoOCBZcz4zbnyC90q67+W2zHy8hcPo=";
  };
}
