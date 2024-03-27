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
  inherit (lib) mkDefault mkForce;
in {
  imports = [
    ./caches
    ./modules
    inputs.agenix.nixosModules.default
  ];

  nix = {
    package = self'.packages.nix;

    registry = let
      mappedRegistry = lib.mapAttrs' (name: flake:
        lib.nameValuePair name {inherit flake;})
      inputs;
    in
      mappedRegistry // {default = mappedRegistry.nixpkgs;};

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

  networking.hosts =
    lib.attrsets.mapAttrs
    (name: _: [name])
    (import ./hostnames.nix);

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
        duf
        ethtool
        iotop-c
        neovim
        self'.packages.btrfs-map-physical
        self'.packages.btrfs-progs
        tcpdump
      ]
      ++ (import ./packages.nix {inherit inputs' pkgs self';});

    etc."nixos/current".source = lib.cleanSource ./..;
  };

  system = {
    configurationRevision = self.rev or self.dirtyRev;

    stateVersion = "23.05";
  };
}
