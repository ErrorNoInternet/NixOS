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
        };
    };
}
