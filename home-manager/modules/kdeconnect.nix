{
    systemd.user.services.kdeconnect = {
        Unit.Description = "KDE Connect Indicator";
        Service = {
            Type = "simple";
            ExecStart = "${pkgs.kdeconnect}/bin/kdeconnect-indicator";
            TimeoutStopSec = 5;
        };
        Install.WantedBy = ["graphical-session.target"];
    };
}
