{
  config,
  lib,
  pkgs,
  ...
}: let
  packages = [
    {
      name = "default";
      value = pkgs.linuxPackages_latest;
    }
    {
      name = "latest";
      value = pkgs.linuxPackages_latest;
    }
    {
      name = "lts";
      value = pkgs.linuxPackages;
    }
    {
      name = "lts-515";
      value = pkgs.linuxPackages_5_15;
    }
    {
      name = "lts-510";
      value = pkgs.linuxPackages_5_10;
    }
    {
      name = "latestZfs";
      value = config.boot.zfs.package.latestCompatibleLinuxPackages;
    }
  ];

  suffix = "error";
in
  builtins.listToAttrs (map (package: {
      inherit (package) name;
      value = let
        inherit (package.value) kernel;
      in
        pkgs.linuxPackagesFor (kernel.override {
          argsOverride = {
            modDirVersion =
              lib.versions.pad 3 "${kernel.version}-${suffix}";
            structuredExtraConfig = with lib.kernel; {
              LOCALVERSION = freeform "-${suffix}";
            };
          };
        });
    })
    packages)
