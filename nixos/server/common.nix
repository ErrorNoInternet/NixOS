{
  config,
  lib,
  pkgs,
  self,
  ...
}: {
  imports = [
    ./modules
    ./profiles
    ./programs
  ];

  documentation.doc.enable = false;

  boot.kernelParams = ["console=tty0"];

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [22];
    };
  };

  services.fail2ban = {
    enable = true;
    ignoreIP = ["192.168.0.101"];

    maxretry = 6;
    bantime = "5m";
    bantime-increment = {
      enable = true;
      multipliers = "1 2 6 12 24 72 144 288 864 2016";
      rndtime = "5m";
    };
    jails = {
      DEFAULT.settings = {
        findtime = "15m";
      };
      sshd = lib.mkForce ''
        enabled = true
        mode = aggressive
        port = ${lib.strings.concatMapStringsSep "," toString config.services.openssh.ports}
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    pueue
  ];

  systemd.services.pueued = {
    wantedBy = ["multi-user.target"];
    description = "pueue daemon";
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      ExecStart = ''${pkgs.pueue}/bin/pueued'';
    };
  };

  users.users = {
    root.initialPassword = "snowflake";
    snowflake = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      initialPassword = "snowflake";
      openssh.authorizedKeys.keys = with (import "${self}/shared/ssh-keys.nix"); [msix ErrorNoPhone];
    };
  };
}
