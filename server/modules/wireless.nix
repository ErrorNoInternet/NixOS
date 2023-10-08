{ config, pkgs }:

{
    age.secrets.wireless-networks.file = ../../secrets/wireless-networks.age;

    networking = {
        wireless = {
            enable = true;
            environmentFile = config.age.secrets.wireless-networks.path;
            networks = {
                "@ssid1@".psk = "@psk1@";
                "@ssid2@".psk = "@psk2@";
            };
        };
    };
}
