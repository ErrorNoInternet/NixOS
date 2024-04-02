{
  config,
  inputs',
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.graphical.spotify;
  inherit (lib) mkEnableOption mkIf;

  spicePkgs = inputs'.spicetify-nix.packages.default;
in {
  imports = [inputs.spicetify-nix.homeManagerModule];

  options.customPrograms.graphical.spotify.enable =
    mkEnableOption "";

  config = mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;

    programs.spicetify = {
      enable = true;
      dontInstall = true;

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        fullAppDisplay
        volumePercentage
      ];

      theme = spicePkgs.themes.text;
      colorScheme = config.colors.schemeName;
    };

    home.packages = let
      unwrapped-spotify = config.programs.spicetify.spicedSpotify;

      sandboxed-spotify =
        (inputs.nixpak.lib.nixpak {inherit lib pkgs;} {
          config = {sloth, ...}: rec {
            app.package = unwrapped-spotify;

            etc.sslCertificates.enable = true;
            flatpak.appId = "com.spotify.Client";

            dbus.policies = {
              "${flatpak.appId}" = "own";
              "org.freedesktop.portal.Desktop" = "talk";
              "org.freedesktop.portal.OpenURI" = "talk";
              "org.gnome.SettingsDaemon.MediaKeys" = "talk";
              "org.mpris.MediaPlayer2.spotify" = "own";
            };

            fonts = {
              enable = true;
              fonts = with pkgs; [
                cantarell-fonts
                dejavu_fonts
                gyre-fonts
                liberation_ttf
                noto-fonts-cjk-sans
                noto-fonts-cjk-serif
                source-code-pro
                source-sans
                twitter-color-emoji
              ];
            };

            bubblewrap = {
              bind = {
                ro = [
                  "/tmp/.X11-unix"
                  (sloth.concat' sloth.xdgDataHome "/gtk-3.0")
                  (sloth.concat' sloth.xdgDataHome "/icons")
                ];
                rw = [
                  (sloth.concat' sloth.xdgCacheHome "/spotify")
                  (sloth.concat' sloth.xdgConfigHome "/spotify")
                ];
              };

              sockets = {
                pulse = true;
                wayland = true;
              };
            };
          };
        })
        .config
        .script;
    in [
      (pkgs.runCommand "spotify-metadata" {} ''
        mkdir -p $out
        cp -a ${unwrapped-spotify}/share $out
      '')

      sandboxed-spotify
    ];
  };
}
