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
        acltype = "posix";
        compression = "zstd";
        dnodesize = "auto";
        encryption = "aes-256-gcm";
        keyformat = "passphrase";
        keylocation = "prompt";
        mountpoint = "none";
        normalization = "formD";
        xattr = "sa";
      };

      datasets = {
        root = {
          mountpoint = "/";
          type = "zfs_fs";
          options.mountpoint = "legacy";
        };
        var = {
          mountpoint = "/var";
          type = "zfs_fs";
          options = {
            mountpoint = "legacy";
            recordsize = "64K";
            refreservation = "1G";
          };
        };
        home = {
          mountpoint = "/home";
          type = "zfs_fs";
          options = {
            mountpoint = "legacy";
            refreservation = "1G";
          };
        };
        nix = {
          mountpoint = "/nix";
          type = "zfs_fs";
          options = {
            "com.sun:auto-snapshot" = "false";
            atime = "off";
            mountpoint = "legacy";
            recordsize = "64K";
          };
        };
        "nix/store" = {
          mountpoint = "/nix/store";
          type = "zfs_fs";
          options = {
            mountpoint = "legacy";
            recordsize = "1M";
          };
        };
      };
    };
  };
}
