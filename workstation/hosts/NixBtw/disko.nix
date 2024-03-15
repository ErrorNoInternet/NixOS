{config, ...}: {
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/disk/by-id/ata-KINGSTON_OMSP0S3512Q-00_50026B738269DB25";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            size = "1G";
            type = "EF00";
            label = "BOOT";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };

          root = {
            size = "100%";
            content = {
              type = "zfs";
              pool = config.host.name;
            };
          };
        };
      };
    };

    zpool."${config.host.name}" = {
      type = "zpool";
      rootFsOptions = {
        "com.sun:auto-snapshot" = "true";
        compression = "zstd";
        encryption = "aes-256-gcm";
        keyformat = "passphrase";
        keylocation = "prompt";
        mountpoint = "none";
      };

      datasets = {
        root = {
          type = "zfs_fs";
          options.mountpoint = "legacy";
          mountpoint = "/";
        };
        var = {
          type = "zfs_fs";
          options.mountpoint = "legacy";
          mountpoint = "/var";
        };
        home = {
          type = "zfs_fs";
          options.mountpoint = "legacy";
          mountpoint = "/home";
        };
        nix = {
          type = "zfs_fs";
          options = {
            mountpoint = "legacy";
            "com.sun:auto-snapshot" = "false";
          };
          mountpoint = "/nix";
        };
      };
    };
  };
}
