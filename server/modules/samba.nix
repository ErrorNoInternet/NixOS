{
    networking.firewall.allowedTCPPorts = [
        # wsdd
        5357
    ];
    networking.firewall.allowedUDPPorts = [
        # wsdd
        3702
    ];

    services = {
        samba-wsdd.enable = true;
        samba = {
            enable = true;
            openFirewall = true;
        };
    };
}
