{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.server.zfs;
  inherit (lib) mkEnableOption mkOption mkIf mkDefault;

  version = "2.2.3-unstable-2024-04-23";
  src = pkgs.fetchFromGitHub {
    owner = "openzfs";
    repo = "zfs";
    rev = "87d81d1d13e0ef848d2d533a4f12f5de41026e73";
    hash = "sha256-X4DsZ1Ex1IU2+iNxbtoujozg5RkJfhmEkZpr88ghf8s=";
  };
  patches = import ./patches {inherit (pkgs) fetchpatch;};
in {
  imports = [
    ./options.nix
    ./zed.nix
  ];

  options.server.zfs = {
    enable = mkEnableOption "" // {default = true;};

    kernelPackages = mkOption {
      default = config.server.kernel.packages.ltsZfs;
    };
  };

  config = mkIf cfg.enable {
    boot = {
      kernelPackages = mkDefault (cfg.kernelPackages.extend (_: prev: {
        zfs_unstable = prev.zfs_unstable.overrideAttrs (old: {
          name = "zfs-kernel-${version}-${prev.kernel.version}";
          inherit version src;
          patches = (old.patches or []) ++ patches;
        });
      }));

      supportedFilesystems = ["zfs"];

      zfs.package = pkgs.zfs_unstable.overrideAttrs (old: {
        name = "zfs-user-${version}";
        inherit version src;
        patches = (old.patches or []) ++ patches;
      });
    };

    environment.systemPackages = [pkgs.ioztat];
  };
}
