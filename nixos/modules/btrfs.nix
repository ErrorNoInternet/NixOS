{
  config,
  lib,
  ...
}: let
  cfg = config.nixos.btrfs.compression;
  inherit (lib) mkEnableOption mkIf attrsets;
in {
  options.nixos.btrfs.compression = {
    enable = mkEnableOption "";

    enableSubvolumeLayout = mkEnableOption "" // {default = true;};
  };

  config = mkIf cfg.enable {
    fileSystems =
      {"/".options = ["compress=zstd" "noatime"];}
      // attrsets.optionalAttrs cfg.enableSubvolumeLayout {
        "/nix".options = ["noatime"];
      };
  };
}
