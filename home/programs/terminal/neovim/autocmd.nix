{
  programs.nixvim.autoCmd = [
    {
      event = [ "TermOpen" ];
      pattern = [ "*" ];
      command = "startinsert";
    }

    {
      event = [ "FileType" ];
      pattern = [ "nix" ];
      command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab";
    }
  ];
}
