{
  programs.git = {
    enable = true;
    userName = "ErrorNoInternet";
    userEmail = "errornointernet@envs.net";
    signing = {
      key = "2486BFB7B1E6A4A3";
      signByDefault = true;
    };
    aliases = {
      "c" = "commit -m";
      "ca" = "commit --amend";
    };
    difftastic.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      index.version = 4;
    };
  };
}
