{
  config,
  lib,
  ...
}: let
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

  config = mkIf config.shared.modules.btrfs.compression.enable {
    fileSystems =
      {
        "/".options = ["compress=zstd"];
      }
      // mkIf config.shared.modules.btrfs.compression.subvolumeLayout {
        "/home".options = ["compress=zstd"];
        "/nix".options = ["compress=zstd" "noatime"];
      };
  };
}
