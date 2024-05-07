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
    ./hardening.nix
    ./modules
    inputs.agenix.nixosModules.default
  ];

  nixpkgs.config.contentAddressedByDefault = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
        "ca-derivations"
      ];
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
      "vm.page-cluster" = 0;
      "vm.swappiness" = 180;
    };

    tmp = {
      useTmpfs = true;
      tmpfsSize = "200%";
    };
  };

  zramSwap = {
    enable = true;
    memoryPercent = 200;
  };

  networking = {
    nameservers = ["1.1.1.1" "8.8.8.8"];

    hosts = attrsets.listToAttrs (map (entry: {
      name = entry.value;
      value = [entry.name];
    }) (attrsets.attrsToList (import ../shared/hostnames.nix)));
  };

  security.sudo.extraConfig = ''
    Defaults:root,%wheel timestamp_timeout=10
  '';

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
        btrfs-map-physical
        btrfs-progs
        duf
        ethtool
        iotop-c
        tcpdump
        whois
      ]
      ++ (import ../shared/packages.nix {
        inherit config inputs' pkgs self';
      });

    etc."nixos/current".source = lib.cleanSource ./..;
  };

  system.configurationRevision = self.rev or self.dirtyRev;
}
