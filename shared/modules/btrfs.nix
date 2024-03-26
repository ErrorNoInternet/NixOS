{
  config,
  lib,
  ...
}: let
  cfg = config.shared.modules.btrfs.compression;
  inherit (lib) mkEnableOption mkIf attrsets;
in {
  options.shared.modules.btrfs.compression = {
    enable = mkEnableOption "";
    subvolumeLayout = mkEnableOption "" // {default = true;};
  };

  config = mkIf cfg.enable {
    fileSystems =
      {
        "/".options = ["compress=zstd" "noatime"];
      }
      // attrsets.optionalAttrs cfg.subvolumeLayout {
        "/home".options = ["compress=zstd"];
        "/nix".options = ["compress=zstd" "noatime"];
      };
  };
}
