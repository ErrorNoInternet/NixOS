{ pkgs, ... }:

{
    networking.hostName = "Pix";
    environment.variables.HOSTNAME = "Pix";

    fileSystems = {
        "/mnt/drive1" = {
            device = "/dev/disk/by-uuid/fc102db2-60b8-43e1-8b21-40a589edfdda";
            fsType = "btrfs";
            options = [ "x-systemd.automount" "noauto" ];
        };
        "/mnt/drive3" = {
            device = "/dev/disk/by-uuid/6a03c0f9-5c76-4a08-9091-aba7239a6429";
            fsType = "btrfs";
            options = [ "x-systemd.automount" "noauto" ];
        };
    };
}
