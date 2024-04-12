{
  config,
  pkgs,
  ...
}: let
  packages = let
    latestLts = pkgs.linuxPackages;
    latestZfs = config.boot.zfs.package.latestCompatibleLinuxPackages;
  in [
    {
      name = "lts";
      value = latestLts;
    }
    {
      name = "ltsZfs";
      value =
        if (builtins.compareVersions latestZfs.kernel.version latestLts.kernel.version) >= 0
        then latestLts
        else builtins.trace "using older ZFS-supported kernel" latestZfs;
    }
  ];
in
  builtins.listToAttrs (map
    (package: {inherit (package) name value;})
    packages)
