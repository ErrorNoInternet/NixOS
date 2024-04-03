{
  config,
  lib,
  ...
}: let
  cfg = config.shared.btrfs.compression;
  inherit (lib) mkEnableOption mkIf attrsets;
in {
  options.shared.btrfs.compression = {
    enable = mkEnableOption "";
    enableSubvolumeLayout = mkEnableOption "" // {default = true;};
  };

  config = mkIf cfg.enable {
    fileSystems =
      {
        "/".options = ["compress=zstd" "noatime"];
      }
      // attrsets.optionalAttrs cfg.enableSubvolumeLayout {
        "/home".options = ["compress=zstd" "relatime"];
        "/nix".options = ["compress=zstd" "noatime"];
      };
  };
}
