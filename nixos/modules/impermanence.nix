{
  config,
  inputs,
  lib,
  ...
}: let
  cfg = config.shared.impermanence;
  inherit (lib) mkEnableOption mkOption mkIf types optional;
in {
  imports = [inputs.impermanence.nixosModules.impermanence];

  options.shared.impermanence = {
    enable = mkEnableOption "";

    directories = mkOption {
      type = with types; listOf str;
      default = [];
    };

    files = mkOption {
      type = with types; listOf str;
      default = [];
    };
  };

  config = mkIf cfg.enable {
    environment.persistence."/persistent" = {
      hideMounts = true;

      directories =
        [
          "/var/lib/nixos"
          "/var/lib/systemd/coredump"
          "/var/log"
        ]
        ++ optional config.shared.flags.isWorkstation "/var/lib/systemd/backlight"
        ++ cfg.directories;

      files =
        [
          "/etc/machine-id"
          "/etc/ssh"
        ]
        ++ cfg.files;
    };
  };
}
