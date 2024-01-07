{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    compsize
    duperemove
    smartmontools
    snapper
    xxd
  ];

  fileSystems = {
    "/mnt/drive1" = {
      device = "/dev/disk/by-uuid/fc102db2-60b8-43e1-8b21-40a589edfdda";
      fsType = "btrfs";
      options = ["subvol=root" "x-systemd.automount" "noauto"];
    };
    "/mnt/drive3" = {
      device = "/dev/disk/by-uuid/6a03c0f9-5c76-4a08-9091-aba7239a6429";
      fsType = "btrfs";
      options = ["subvol=root" "x-systemd.automount" "noauto"];
    };
  };

  services.snapper = {
    configs = {
      drive1 = {
        SUBVOLUME = "/mnt/drive1";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;

        TIMELINE_LIMIT_HOURLY = 24;
        TIMELINE_LIMIT_DAILY = 14;
        TIMELINE_LIMIT_MONTHLY = 1;
        TIMELINE_LIMIT_YEARLY = 0;
      };
      drive3 = {
        SUBVOLUME = "/mnt/drive3";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;

        TIMELINE_LIMIT_HOURLY = 24;
        TIMELINE_LIMIT_DAILY = 14;
        TIMELINE_LIMIT_MONTHLY = 1;
        TIMELINE_LIMIT_YEARLY = 0;
      };
    };
  };

  services.nfs.server.exports = ''
    /mnt/drive1 localhost(rw,sync,no_subtree_check,no_root_squash)
    /mnt/drive3 localhost(rw,sync,no_subtree_check,no_root_squash)
    /mnt/drive1 192.168.0.101(rw,sync,no_subtree_check,no_root_squash)
    /mnt/drive3 192.168.0.101(rw,sync,no_subtree_check,no_root_squash)
  '';

  services.samba = {
    securityType = "user";
    extraConfig = ''
      create mask = 644
      directory mask = 755
      force group = users
      force user = snowflake
      map to guest = bad user
      workgroup = WORKGROUP

      valid users = snowflake
    '';
    shares = {
      printers = {
        path = "/var/spool/samba";
        "create mode" = 0700;
        "valid users" = "snowflake";
        browseable = "yes";
        comment = "All Printers";
        printable = "yes";
        writeable = "no";
      };
      drive1 = {
        path = "/mnt/drive1";
        "follow symlinks" = "yes";
        "valid users" = "snowflake";
        browseable = "yes";
        writeable = "yes";
      };
      drive3 = {
        path = "/mnt/drive3";
        "follow symlinks" = "yes";
        "valid users" = "snowflake";
        browseable = "yes";
        writeable = "yes";
      };
    };
  };
  systemd.tmpfiles.rules = [
    "d /var/spool/samba 1777 root root -"
  ];
}
