{
  config,
  lib,
  ...
}: let
  cfg = config.customPrograms.git;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.customPrograms.git = {
    enable = mkEnableOption "" // {default = true;};

    user = {
      name = mkOption {
        type = with types; nullOr str;
        default = null;
      };

      email = mkOption {
        type = with types; nullOr str;
        default = "errornointernet@envs.net";
      };
    };

    signing = {
      key = mkOption {
        type = with types; nullOr str;
        default = null;
      };

      signByDefault = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;

      userName = with cfg.user; mkIf (name != null) name;
      userEmail = with cfg.user; mkIf (email != null) email;
      inherit (cfg) signing;

      extraConfig = {
        advice = {
          addEmptyPathspec = false;
          detachedHead = false;
        };
        branch.sort = "-committerdate";
        core.filemode = true;
        diff = {
          submodule = "log";
          algorithm = "histogram";
        };
        index.version = 4;
        init.defaultBranch = "main";
        merge.conflictstyle = "zdiff3";
        pull.rebase = true;
        status.submoduleSummary = true;
      };

      delta = {
        enable = true;

        options = {
          syntax-theme = config.colors.schemeName;
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
