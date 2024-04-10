{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  packages = [
    {
      name = "latest";
      value = pkgs.linuxPackages_latest;
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
        (pkgs.linuxPackagesFor
          (kernel.override {
            argsOverride = {
              modDirVersion =
                lib.versions.pad 3 "${kernel.version}-${suffix}";
              structuredExtraConfig = with lib.kernel; {
                LOCALVERSION = freeform "-${suffix}";
              };
            };
          }))
        .extend (_: prev: {
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
        });
    })
    packages)
