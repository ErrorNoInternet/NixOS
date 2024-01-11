{
  inputs,
  lib,
  ...
}: {
  imports = [
    ./caches
    ./modules
  ];

  i18n.defaultLocale = "en_US.UTF-8";
  documentation.nixos.enable = false;
  services.getty.helpLine = lib.mkForce "";
  programs.command-not-found.enable = false;

  nix = {
    registry =
      lib.mapAttrs'
      (name: flake: let
        name' =
          if (name == "self")
          then "config"
          else name;
      in
        lib.nameValuePair name' {inherit flake;})
      inputs;
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
}
