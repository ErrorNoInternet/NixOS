{
  config,
  inputs,
  lib,
  ...
}: let
  cfg = config.shared.impermanence;
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [inputs.impermanence.nixosModules.impermanence];

  options.shared.impermanence = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    environment.persistence."/persistent" = {
      hideMounts = true;
      directories = [
        "/var/lib/bluetooth"
        "/var/lib/nixos"
        "/var/lib/systemd/backlight"
        "/var/lib/systemd/coredump"
        "/var/log"
      ];
      files = [
        "/etc/machine-id"
        "/etc/ssh"
      ];
    };
  };
}
