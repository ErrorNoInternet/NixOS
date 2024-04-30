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

      options = {
        ashift = "12";
        compatibility = "openzfs-2.2-linux";
      };

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
          options = {
            mountpoint = "legacy";
            recordsize = "64K";
          };
        };
        "root/home" = {
          mountpoint = "/home";
          type = "zfs_fs";
          options = {
            mountpoint = "legacy";
            refreservation = "1G";
          };
        };
        "root/var" = {
          mountpoint = "/var";
          type = "zfs_fs";
          options.mountpoint = "legacy";
        };
        "root/var/coredump" = {
          mountpoint = "/var/lib/systemd/coredump";
          type = "zfs_fs";
          options = {
            atime = "off";
            compression = "zle";
            mountpoint = "legacy";
            recordsize = "1M";
          };
        };
        "root/var/log" = {
          mountpoint = "/var/log";
          type = "zfs_fs";
          options = {
            atime = "off";
            mountpoint = "legacy";
            recordsize = "16K";
          };
        };
        "root/nix" = {
          mountpoint = "/nix";
          type = "zfs_fs";
          options = {
            atime = "off";
            mountpoint = "legacy";
            recordsize = "32K";
          };
        };
        "root/nix/store" = {
          mountpoint = "/nix/store";
          type = "zfs_fs";
          options = {
            "com.sun:auto-snapshot" = "false";
            mountpoint = "legacy";
            recordsize = "256K";
          };
        };
      };
    };
  };
}
