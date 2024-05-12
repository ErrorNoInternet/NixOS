{pkgs, ...}: {
  services.snapper = {
    snapshotInterval = "*:0/30";
    cleanupInterval = "3d";

    configs = {
      home = {
        SUBVOLUME = "/home";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;

        TIMELINE_LIMIT_HOURLY = 24;
        TIMELINE_LIMIT_DAILY = 7;
        TIMELINE_LIMIT_WEEKLY = 0;
        TIMELINE_LIMIT_MONTHLY = 0;
        TIMELINE_LIMIT_YEARLY = 0;
      };

      backups = {
        SUBVOLUME = "/mnt/data/backups";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;

        TIMELINE_LIMIT_HOURLY = 24;
        TIMELINE_LIMIT_DAILY = 0;
        TIMELINE_LIMIT_WEEKLY = "1-4";
        TIMELINE_LIMIT_MONTHLY = 0;
        TIMELINE_LIMIT_YEARLY = 0;
      };

      code = {
        SUBVOLUME = "/mnt/data/code";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;

        TIMELINE_LIMIT_HOURLY = 24;
        TIMELINE_LIMIT_DAILY = "7-14";
        TIMELINE_LIMIT_MONTHLY = "0-1";
        TIMELINE_LIMIT_YEARLY = 0;
      };

      downloads = {
        SUBVOLUME = "/mnt/data/downloads";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;

        TIMELINE_LIMIT_HOURLY = "1-24";
        TIMELINE_LIMIT_DAILY = "1-3";
        TIMELINE_LIMIT_MONTHLY = 0;
        TIMELINE_LIMIT_YEARLY = 0;
      };

      games = {
        SUBVOLUME = "/mnt/data/games";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;

        TIMELINE_LIMIT_HOURLY = 24;
        TIMELINE_LIMIT_DAILY = "7-14";
        TIMELINE_LIMIT_MONTHLY = 1;
        TIMELINE_LIMIT_YEARLY = 0;
      };

      haxxor = {
        SUBVOLUME = "/mnt/data/haxxor";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;

        TIMELINE_LIMIT_HOURLY = 24;
        TIMELINE_LIMIT_DAILY = "1-3";
        TIMELINE_LIMIT_MONTHLY = 0;
        TIMELINE_LIMIT_YEARLY = 0;
      };

      machines = {
        SUBVOLUME = "/mnt/data/machines";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;

        TIMELINE_LIMIT_HOURLY = 24;
        TIMELINE_LIMIT_DAILY = "1-3";
        TIMELINE_LIMIT_MONTHLY = 0;
        TIMELINE_LIMIT_YEARLY = 0;
      };

      media = {
        SUBVOLUME = "/mnt/data/media";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;

        TIMELINE_LIMIT_HOURLY = 24;
        TIMELINE_LIMIT_DAILY = "3-7";
        TIMELINE_LIMIT_WEEKLY = "1-4";
        TIMELINE_LIMIT_MONTHLY = 0;
        TIMELINE_LIMIT_YEARLY = 0;
      };

      other = {
        SUBVOLUME = "/mnt/data/other";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;

        TIMELINE_LIMIT_HOURLY = "12-24";
        TIMELINE_LIMIT_DAILY = "3-7";
        TIMELINE_LIMIT_MONTHLY = 1;
        TIMELINE_LIMIT_YEARLY = 0;
      };

      programs = {
        SUBVOLUME = "/mnt/data/programs";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;

        TIMELINE_LIMIT_HOURLY = "12-24";
        TIMELINE_LIMIT_DAILY = "1-3";
        TIMELINE_LIMIT_MONTHLY = 1;
        TIMELINE_LIMIT_YEARLY = 0;
      };

      projects = {
        SUBVOLUME = "/mnt/data/projects";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;

        TIMELINE_LIMIT_HOURLY = 24;
        TIMELINE_LIMIT_DAILY = "7-14";
        TIMELINE_LIMIT_MONTHLY = "0-1";
        TIMELINE_LIMIT_YEARLY = 0;
      };

      temporary = {
        SUBVOLUME = "/mnt/data/temporary";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;

        TIMELINE_LIMIT_HOURLY = "1-24";
        TIMELINE_LIMIT_DAILY = "1-3";
        TIMELINE_LIMIT_MONTHLY = 0;
        TIMELINE_LIMIT_YEARLY = 0;
      };

      torrents = {
        SUBVOLUME = "/mnt/data/torrents";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;

        TIMELINE_LIMIT_HOURLY = "1-24";
        TIMELINE_LIMIT_DAILY = "1-3";
        TIMELINE_LIMIT_MONTHLY = 0;
        TIMELINE_LIMIT_YEARLY = 0;
      };
    };
  };

  environment.systemPackages = [pkgs.snapper];

  fileSystems."/mnt/data" = {
    device = "/dev/bcache0";
    fsType = "btrfs";
    options = ["noauto" "compress=zstd"];
  };
}
