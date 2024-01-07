{pkgs, ...}: {
  environment.systemPackages = with pkgs; [snapper];

  services.snapper = {
    snapshotInterval = "30min";
    configs = {
      backups = {
        SUBVOLUME = "/mnt/data/backups";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        QGROUP = "1/0";

        TIMELINE_LIMIT_HOURLY = 24;
        TIMELINE_LIMIT_DAILY = 0;
        TIMELINE_LIMIT_WEEKLY = "1-4";
        TIMELINE_LIMIT_MONTHLY = 0;
        TIMELINE_LIMIT_YEARLY = 0;
      };
      downloads = {
        SUBVOLUME = "/mnt/data/downloads";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        QGROUP = "1/0";

        TIMELINE_LIMIT_HOURLY = "1-12";
        TIMELINE_LIMIT_DAILY = "1-3";
        TIMELINE_LIMIT_MONTHLY = 0;
        TIMELINE_LIMIT_YEARLY = 0;
      };
      games = {
        SUBVOLUME = "/mnt/data/games";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        QGROUP = "1/0";

        TIMELINE_LIMIT_HOURLY = 24;
        TIMELINE_LIMIT_DAILY = "7-14";
        TIMELINE_LIMIT_MONTHLY = 1;
        TIMELINE_LIMIT_YEARLY = 0;
      };
      hacking = {
        SUBVOLUME = "/mnt/data/hacking";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        QGROUP = "1/0";

        TIMELINE_LIMIT_HOURLY = 12;
        TIMELINE_LIMIT_DAILY = "1-3";
        TIMELINE_LIMIT_MONTHLY = 0;
        TIMELINE_LIMIT_YEARLY = 0;
      };
      media = {
        SUBVOLUME = "/mnt/data/media";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        QGROUP = "1/0";

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
        QGROUP = "1/0";

        TIMELINE_LIMIT_HOURLY = "12-24";
        TIMELINE_LIMIT_DAILY = "3-7";
        TIMELINE_LIMIT_MONTHLY = 1;
        TIMELINE_LIMIT_YEARLY = 0;
      };
      scripts = {
        SUBVOLUME = "/mnt/data/scripts";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        QGROUP = "1/0";

        TIMELINE_LIMIT_HOURLY = 24;
        TIMELINE_LIMIT_DAILY = "7-14";
        TIMELINE_LIMIT_MONTHLY = "0-1";
        TIMELINE_LIMIT_YEARLY = 0;
      };
      temporary = {
        SUBVOLUME = "/mnt/data/temporary";
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        QGROUP = "1/0";

        TIMELINE_LIMIT_HOURLY = "1-12";
        TIMELINE_LIMIT_DAILY = 0;
        TIMELINE_LIMIT_MONTHLY = 0;
        TIMELINE_LIMIT_YEARLY = 0;
      };
    };
  };
}
