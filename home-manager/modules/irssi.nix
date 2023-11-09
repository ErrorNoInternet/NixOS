{
  programs.irssi = {
    enable = true;
    networks = {
      liberachat = {
        nick = "ErrorNoInternet";
        server = {
          address = "irc.libera.chat";
          port = 6697;
        };
      };
      oftc = {
        nick = "ErrorNoInternet";
        server = {
          address = "irc.oftc.net";
          port = 6697;
        };
      };
    };
  };
  home.file.".irssi/default.theme".text = ''
    abstracts = {
      sb_background = "%4%k";
      sb_foreground = "%*";
    };
  '';
}
