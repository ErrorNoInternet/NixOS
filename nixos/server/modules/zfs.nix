{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  cfg = config.server.zfs;
  inherit (lib) mkEnableOption mkOption mkIf mkDefault;
in {
  options.server.zfs = {
    enable = mkEnableOption "" // {default = true;};

    kernelPackages = mkOption {
      default = config.server.pkgsKernels.ltsZfs;
    };
  };

  config = mkIf cfg.enable {
    age.secrets.server-zed.file = "${self}/secrets/server-zed.age";

    boot = {
      kernelPackages = mkDefault (cfg.kernelPackages.extend (_: prev: {
        zfs_unstable = prev.zfs_unstable.overrideAttrs (old: let
          inherit
            (import "${self}/packages/zfs-unstable/source.nix"
              {inherit (pkgs) fetchFromGitHub;})
            version
            src
            patches
            ;
        in {
          name = "zfs-kernel-${version}-${prev.kernel.version}";
          inherit version src;
          patches = (old.patches or []) ++ patches;
        });
      }));

      supportedFilesystems = ["zfs"];

      zfs = {
        package = pkgs.zfs_unstable;
        forceImportRoot = false;
      };
    };

    services.zfs.zed.settings = {
      ZED_NOTIFY_INTERVAL_SECS = 60;
      ZED_NOTIFY_VERBOSE = 1;
    };

    environment = {
      systemPackages = [pkgs.ioztat];

      etc."zfs/zed.d/zed.rc".text = ''
        source ${config.age.secrets.server-zed.path}
      '';
    };
  };
}
