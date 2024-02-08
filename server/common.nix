{
  config,
  inputs,
  lib,
  pkgs,
  self',
  ...
}: {
  imports = [
    ../shared
    ./modules
    ./profiles
    ./programs
    inputs.agenix.nixosModules.default
  ];

  boot = {
    kernelParams = ["console=tty0"];
    supportedFilesystems = ["ntfs"];
  };

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [22];
    };
  };

  services = {
    openssh.enable = true;
    fail2ban = {
      enable = true;
      ignoreIP = ["192.168.0.101"];
      maxretry = 6;
      bantime-increment = {
        enable = true;
        multipliers = "1 2 6 12 24 72 144 288 864 2016";
        rndtime = "5m";
      };
      jails = {
        DEFAULT.settings = {
          findtime = "15m";
          # TODO: wait for upstream fix
          bantime = lib.mkForce "5m";
        };
        sshd = lib.mkForce ''
          enabled = true
          mode = aggressive
          port = ${lib.strings.concatMapStringsSep "," toString config.services.openssh.ports}
        '';
      };
    };
  };

  environment.systemPackages = with pkgs; [
    btop
    dua
    duf
    fd
    procs
    pueue
    self'.packages.btrfs-progs
    self'.packages.nix
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
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDzdpxex2GlFVf5G2qsh3Ixa/XCMjnbq4JSTmAev7WYJ"
      ];
    };
  };

  environment.etc."nixos/current".source = ./.;
  system.stateVersion = "23.05";
}
