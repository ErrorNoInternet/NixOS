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
          options.mountpoint = "legacy";
          type = "zfs_fs";
        };
        var = {
          mountpoint = "/var";
          options.mountpoint = "legacy";
          refreservation = "1G";
          type = "zfs_fs";
        };
        home = {
          mountpoint = "/home";
          options.mountpoint = "legacy";
          refreservation = "1G";
          type = "zfs_fs";
        };
        nix = {
          mountpoint = "/nix";
          options = {
            mountpoint = "legacy";
            "com.sun:auto-snapshot" = "false";
          };
          type = "zfs_fs";
        };
      };
    };
  };
}
