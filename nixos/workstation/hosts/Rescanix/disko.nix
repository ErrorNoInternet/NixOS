{config, ...}: {
  disko.devices = {
    disk.primary = {
      type = "disk";
      device = "/dev/sda";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            size = "512M";
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

    zpool.${config.host.name} = {
      type = "zpool";

      options.ashift = 12;
      rootFsOptions = {
        acltype = "posix";
        compression = "zstd";
        dnodesize = "auto";
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
