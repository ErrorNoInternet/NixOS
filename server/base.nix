{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    registry =
      lib.mapAttrs'
        (name: flake:
          let
            name' = if (name == "self") then "config" else name;
          in
          lib.nameValuePair name' { inherit flake; })
        inputs;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    extraOptions = ''
      min-free = ${toString (1024 * 1024 * 1024 * 5)}
      max-free = ${toString (1024 * 1024 * 1024 * 10)}
    '';
  };

  i18n.defaultLocale = "en_US.UTF-8";
  boot = {
    kernelParams = [ "console=tty0" ];
    supportedFilesystems = [ "ntfs" ];
  };
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
    };
  };
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
  environment.systemPackages = with pkgs; [
    btop
    curl
    dua
    duf
    fd
    file
    git
    lsof
    neovim
    procs
    pueue
    ripgrep
    sysstat
    tmux
    unzip
    wget
    zip
  ];

  systemd.services.pueued = {
    wantedBy = [ "multi-user.target" ];
    description = "pueue daemon";
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      ExecStart = ''${pkgs.pueue}/bin/pueued'';
    };
  };

  services = {
    openssh.enable = true;
    fail2ban = {
      enable = true;
      ignoreIP = [ "192.168.0.101" ];
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
          port = ${lib.strings.concatMapStringsSep "," (p: toString p) config.services.openssh.ports}
        '';
      };
    };
  };

  users.users = {
    root.password = "snowflake";
    snowflake = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      initialPassword = "snowflake";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDzdpxex2GlFVf5G2qsh3Ixa/XCMjnbq4JSTmAev7WYJ"
      ];
    };
  };

  environment.etc."current-nixos".source = ./.;
  system.stateVersion = "23.05";
}
