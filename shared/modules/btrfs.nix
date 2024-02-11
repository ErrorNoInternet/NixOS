{
  config,
  lib,
  ...
}: let
  cfg = config.shared.modules.btrfs.compression;
  inherit (lib) mkEnableOption mkIf;
in {
  options.shared.modules.btrfs.compression = {
    enable =
      mkEnableOption ""
      // {
        default = true;
      };

    subvolumeLayout =
      mkEnableOption ""
      // {
        default = true;
      };
  };

  config = mkIf cfg.enable {
    fileSystems =
      {
        "/".options = ["compress=zstd"];
      }
      // mkIf cfg.subvolumeLayout {
        "/home".options = ["compress=zstd"];
        "/nix".options = ["compress=zstd" "noatime"];
      };
  };
}
