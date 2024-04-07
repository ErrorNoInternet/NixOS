{
  config,
  inputs',
  inputs,
  lib,
  pkgs,
  self',
  self,
  ...
}: let
  inherit (lib) mkDefault mkForce attrsets;
in {
  imports = [
    ../caches
    ./modules
    inputs.agenix.nixosModules.default
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      flake-registry = "";
      log-lines = 500;
      show-trace = true;
      trusted-users = ["root" "@wheel"];

      max-free = 20 * 1024 * 1024 * 1024;
      min-free = 5 * 1024 * 1024 * 1024;
    };

    gc = {
      automatic = mkDefault true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  boot = {
    kernelParams = ["boot.shell_on_fail"];

    kernel.sysctl = {
      "net.ipv4.conf.all.accept_redirects" = 0;
      "net.ipv4.conf.all.secure_redirects" = 0;
      "net.ipv4.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.default.secure_redirects" = 0;
      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv6.conf.default.accept_redirects" = 0;

      "net.ipv4.tcp_fin_timeout" = 30;

      "vm.page-cluster" = 0;
      "vm.swappiness" = 180;
    };

    tmp = {
      useTmpfs = true;
      tmpfsSize = "100%";
    };
  };

  zramSwap = {
    enable = true;
    memoryPercent = 200;
  };

  networking.hosts = attrsets.listToAttrs (map (entry: {
    name = entry.value;
    value = [entry.name];
  }) (attrsets.attrsToList (import ../hostnames.nix)));

  services = {
    getty = {
      greetingLine = ''>>> NixOS ${config.system.nixos.label} (\m) - \l'';
      helpLine = mkForce "";
    };

    openssh.enable = mkDefault true;
  };

  programs.command-not-found.enable = false;

  environment = {
    systemPackages = with pkgs;
      [
        bandwhich
        btop
        config.pkgsSelf.btrfs-map-physical
        config.pkgsSelf.btrfs-progs
        config.pkgsSelf.neovim
        duf
        ethtool
        iotop-c
        tcpdump
      ]
      ++ (import ../packages.nix {
        inherit config inputs' pkgs self';
      });

    etc."nixos/current".source = lib.cleanSource ./..;
  };

  system.configurationRevision = self.rev or self.dirtyRev;
}
