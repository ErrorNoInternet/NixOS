{
  inputs,
  lib,
  pkgs,
  self',
  ...
}: {
  imports = [
    ./caches
    ./modules
  ];

  i18n.defaultLocale = "en_US.UTF-8";
  documentation = {
    nixos.enable = false;
    man.generateCaches = false;
  };

  nix = {
    registry = let
      mappedRegistry =
        lib.mapAttrs'
        (name: flake: let
          name' =
            if (name == "self")
            then "config"
            else name;
        in
          lib.nameValuePair name' {inherit flake;})
        inputs;
    in
      mappedRegistry // {default = mappedRegistry.nixpkgs;};
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "@wheel"];
      auto-optimise-store = true;
      log-lines = 500;

      min-free = 5 * 1024 * 1024 * 1024;
      max-free = 20 * 1024 * 1024 * 1024;
    };
    gc = {
      automatic = lib.mkDefault true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
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
    getty.helpLine = lib.mkForce "";

    openssh.enable = true;
  };

  programs.command-not-found.enable = false;
  environment = {
    systemPackages = with pkgs; [
      curl
      dig
      file
      git
      killall
      lsof
      neovim
      ripgrep
      self'.packages.hwatch
      sysstat
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
