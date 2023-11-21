let
  nickname = "ErrorNoInternet";
in
{
  programs.irssi = {
    enable = true;
    networks = {
      liberachat = {
        nick = "${nickname}";
        server = {
          address = "irc.libera.chat";
          port = 6697;
        };
      };
      oftc = {
        nick = "${nickname}";
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
