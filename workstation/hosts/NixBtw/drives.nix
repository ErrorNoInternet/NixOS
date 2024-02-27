{
  config,
  pkgs,
  ...
}: {
  services = {
    zfs.autoSnapshot = {
      enable = true;
      monthly = 1;
    };

    snapper = {
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
      };
    };
  };

  systemd.timers = {
    snapper-cleanup.enable = false;
    custom-snapper-cleanup = {
      wantedBy = ["timers.target"];
      timerConfig = {
        OnBootSec = "10m";
        OnUnitActiveSec = config.services.snapper.cleanupInterval;
        Unit = "snapper-cleanup.service";
      };
    };
  };

  environment.systemPackages = [pkgs.snapper];
}
