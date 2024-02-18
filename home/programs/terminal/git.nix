{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.home.programs.terminal.git.enable = mkEnableOption "";

  config = mkIf config.home.programs.terminal.git.enable {
    programs.git = {
      enable = true;

      userName = "ErrorNoInternet";
      userEmail = "errornointernet@envs.net";
      signing = {
        key = "2486BFB7B1E6A4A3";
        signByDefault = true;
      };
      extraConfig = {
        advice.addEmptyPathspec = false;
        core.filemode = true;
        index.version = 4;
        init.defaultBranch = "main";
        pull.rebase = false;
      };

      delta = {
        enable = true;
        options = {
          syntax-theme = "Nord";
          side-by-side = true;
          hunk-header-decoration-style = "ul";
          line-numbers-minus-style = "red";
          line-numbers-plus-style = "green";
          line-numbers-zero-style = "gray";
        };
      };
    };
  };
}
