{config, ...}: {
  disko.devices = {
    disk.primary = {
      type = "disk";
      device = "/dev/vda";
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
          };
        };
        "root/nix" = {
          mountpoint = "/nix";
          type = "zfs_fs";
          options = {
            atime = "off";
            mountpoint = "legacy";
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
