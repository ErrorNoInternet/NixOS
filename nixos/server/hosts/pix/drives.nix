{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    compsize
    duperemove
    smartmontools
    snapper
    xxd
  ];

  fileSystems."/mnt/drive3" = {
    device = "/dev/disk/by-uuid/6a03c0f9-5c76-4a08-9091-aba7239a6429";
    fsType = "btrfs";
    options = ["relatime" "x-systemd.automount" "noauto"];
  };

  services = {
    btrfs.autoScrub = {
      enable = true;
      fileSystems = [
        "/"
        "/mnt/drive3"
      ];
    };

    snapper.configs.drive3 = {
      SUBVOLUME = "/mnt/drive3";
      TIMELINE_CREATE = true;
      TIMELINE_CLEANUP = true;

      TIMELINE_LIMIT_HOURLY = 24;
      TIMELINE_LIMIT_DAILY = 14;
      TIMELINE_LIMIT_MONTHLY = 1;
      TIMELINE_LIMIT_YEARLY = 0;
    };

    zfs = {
      autoScrub = {
        enable = true;
        interval = "monthly";
        pools = [
          "drive1"
        ];
      };

      autoSnapshot = {
        enable = true;

        frequent = 0;
        hourly = 0;
      };
    };

    nfs.server.exports = ''
      /mnt/drive3 192.168.0.101(rw,sync,no_root_squash)
    '';

    samba = {
      securityType = "user";
      shares = {
        printers = {
          path = "/var/spool/samba";
          "create mode" = 0700;
          comment = "All Printers";
          printable = "yes";
          writeable = "no";
        };
        drive1 = {
          path = "/mnt/drive1";
          "follow symlinks" = "yes";
          writeable = "yes";
        };
        drive3 = {
          path = "/mnt/drive3";
          "follow symlinks" = "yes";
          writeable = "yes";
        };
      };
    };
  };
  systemd.tmpfiles.rules = [
    "d /var/spool/samba 1777 root root -"
  ];
}
