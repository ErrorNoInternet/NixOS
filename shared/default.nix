{
  inputs,
  lib,
  ...
}: {
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
    };
    gc = {
      automatic = lib.mkDefault true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    extraOptions = ''
      min-free = ${toString (1024 * 1024 * 1024 * 5)}
      max-free = ${toString (1024 * 1024 * 1024 * 20)}
    '';
  };
  i18n.defaultLocale = "en_US.UTF-8";
  services.getty.helpLine = lib.mkForce "";
  documentation.nixos.enable = false;
  programs.command-not-found.enable = false;
}
