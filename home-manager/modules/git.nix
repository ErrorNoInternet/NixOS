{ secrets, ... }:

{
    programs.git = {
        enable = true;
        userName = secrets.git.userName;
        userEmail = secrets.git.userEmail;
        signing = {
            key = secrets.git.signingKey;
            signByDefault = true;
        };
        aliases = {
            "c" = "commit -m";
        };
        difftastic.enable = true;
        extraConfig = {
            init.defaultBranch = "main";
            pull.rebase = false;
        };
    };
}
