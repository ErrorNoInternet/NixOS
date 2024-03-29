{
  programs.nixvim = {
    filetype.pattern = {
      ".*/hyprland%.conf" = "hyprlang";
    };

    autoCmd = [
      {
        event = ["FileType"];
        pattern = ["nix"];
        command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab";
      }

      {
        event = ["TermOpen"];
        pattern = ["*"];
        command = "startinsert";
      }
    ];
  };
}
