{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  cfg = config.workstation.zfs;
  inherit (lib) mkEnableOption mkOption mkIf mkDefault;
in {
  options.workstation.zfs = {
    enable = mkEnableOption "" // {default = true;};

    kernelPackages = mkOption {
      default = config.workstation.pkgsKernels.latest;
    };
  };

  config = mkIf cfg.enable {
    age.secrets.workstation-zed.file = "${self}/secrets/workstation-zed.age";

    services.zfs.autoSnapshot.monthly = 3;

    boot = {
      supportedFilesystems = ["zfs"];

      loader.grub.zfsSupport = true;

      kernelPackages = mkDefault (cfg.kernelPackages.extend (_: prev: {
        zfs_unstable = prev.zfs_unstable.overrideAttrs (old: let
          inherit
            (import "${self}/packages/zfs-unstable/source.nix"
              {inherit (pkgs) fetchFromGitHub;})
            src
            version
            ;
        in {
          inherit src version;
          name = "zfs-kernel-${version}-${prev.kernel.version}";

          patches =
            (old.patches or [])
            ++ ["${self}/packages/zfs-unstable/chacha20poly1305.patch"];
        });
      }));

      zfs = {
        package = pkgs.zfs_unstable;
        forceImportRoot = false;
      };

      extraModprobeConfig = ''
        options zfs zfs_bclone_enabled=1
      '';
    };

    services.zfs.zed.settings = {
      ZED_NOTIFY_INTERVAL_SECS = 60;
      ZED_NOTIFY_VERBOSE = 1;
    };

    environment = {
      systemPackages = [pkgs.ioztat];

      etc."zfs/zed.d/zed.rc".text = ''
        source ${config.age.secrets.workstation-zed.path}
      '';
    };
  };
}
