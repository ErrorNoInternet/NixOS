{config, ...}: {
  disko.devices.disk.primary = {
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

        luks = {
          size = "100%";
          label = "root";

          content = {
            type = "luks";

            name = "luks_${config.host.name}";
            settings.allowDiscards = true;
            extraFormatArgs = [
              "--pbkdf argon2id"
              "--pbkdf-force-iterations 8"
              "--pbkdf-memory 1048576"
              "--pbkdf-parallel 4"
            ];

            content = {
              type = "btrfs";
              extraArgs = [
                "-L ${config.host.name}"
                "-O bgt"
              ];

              subvolumes = {
                "@" = {
                  mountpoint = "/";
                  mountOptions = ["compress=zstd"];
                };
                "@home" = {
                  mountpoint = "/home";
                  mountOptions = ["compress=zstd"];
                };
                "@var" = {
                  mountpoint = "/var";
                  mountOptions = ["compress=zstd"];
                };
                "@nix" = {
                  mountpoint = "/nix";
                  mountOptions = ["compress=zstd" "noatime"];
                };
              };
            };
          };
        };
      };
    };
  };
}
