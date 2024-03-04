{
  config,
  inputs,
  lib,
  pkgs,
  self',
  ...
}: let
  inherit (lib) mkDefault mkForce;
in {
  imports = [
    ./caches
    ./modules
  ];

  documentation.doc.enable = false;

  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    registry = let
      mappedRegistry = lib.mapAttrs' (name: flake:
        lib.nameValuePair name {inherit flake;})
      inputs;
    in
      mappedRegistry // {default = mappedRegistry.nixpkgs;};

    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "@wheel"];
      auto-optimise-store = true;
      log-lines = 500;

      min-free = 5 * 1024 * 1024 * 1024;
      max-free = 20 * 1024 * 1024 * 1024;
    };

    gc = {
      automatic = mkDefault true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  boot.kernel.sysctl = {
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

  zramSwap = {
    enable = true;
    memoryPercent = 200;
  };

  networking.hosts = {
    "192.168.0.100" = ["Pix.local"];
    "192.168.0.101" = ["NixBtw.local"];
  };

  services = {
    getty = {
      greetingLine = ''>>> NixOS ${config.system.nixos.label} (\m) - \l'';
      helpLine = mkForce "";
    };

    openssh.enable = mkDefault true;
  };

  programs.command-not-found.enable = false;
  environment = {
    systemPackages = with pkgs; [
      curl
      dig
      dua
      dust
      file
      git
      iotop
      killall
      lsof
      neovim
      ripgrep
      self'.packages.btrfs-map-physical
      self'.packages.btrfs-progs
      self'.packages.hwatch
      self'.packages.nix
      sysstat
      tcpdump
      tmux
      traceroute
      unzip
      vim
      wget
      zip
    ];

    etc."nixos/current".source = lib.cleanSource ./..;
  };

  system.stateVersion = "23.05";
}
