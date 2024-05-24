{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  cfg = config.server.zfs;
  inherit (lib) mkEnableOption mkOption mkIf mkDefault;

  version = "2.2.4-unstable-2024-05-24";
  src = pkgs.fetchFromGitHub {
    owner = "openzfs";
    repo = "zfs";
    rev = "efbef9e6cc1e14cc19a24b76175f7ec86610161a";
    hash = "sha256-4eU2qSedecGwmOFwJ25PdnbH2pD7w4sH5Yd0unYXMYE=";
  };
  patches = import ./patches {inherit self;};
in {
  imports = [
    ./options.nix
    ./zed.nix
  ];

  options.server.zfs = {
    enable = mkEnableOption "" // {default = true;};

    kernelPackages = mkOption {
      default = config.server.kernel.availablePackages.ltsZfs;
    };
  };

  config = mkIf cfg.enable {
    server.kernel.packages = mkDefault (cfg.kernelPackages.extend (_: prev: {
      zfs_unstable = prev.zfs_unstable.overrideAttrs (old: {
        name = "zfs-kernel-${version}-${prev.kernel.version}";
        inherit version src;
        patches = (old.patches or []) ++ patches;
        meta = old.meta // {broken = false;};
      });
    }));

    boot.zfs.package = pkgs.zfs_unstable.overrideAttrs (old: {
      name = "zfs-user-${version}";
      inherit version src;
      patches = (old.patches or []) ++ patches;
      meta = old.meta // {broken = false;};
    });
  };
}
