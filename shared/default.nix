{
  inputs,
  lib,
  ...
}: {
  nix = let
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
  in {
    registry = mappedRegistry // {default = mappedRegistry.nixpkgs;};
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "@wheel"];
      auto-optimise-store = true;
      log-lines = 50;
      min-free = 5 * 1024 * 1024 * 1024;
      max-free = 20 * 1024 * 1024 * 1024;
    };
    gc = {
      automatic = lib.mkDefault true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
  i18n.defaultLocale = "en_US.UTF-8";
  services.getty.helpLine = lib.mkForce "";
  documentation.nixos.enable = false;
  programs.command-not-found.enable = false;
}
