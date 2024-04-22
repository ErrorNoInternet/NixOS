{
  config,
  inputs',
  lib,
  pkgs,
  ...
}: let
  cfg = config.profiles.windowManager;
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.windowManager.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    wallpaper.enable = true;

    home.packages = with pkgs; let
      customSlurp = slurp.overrideAttrs (old: {
        nativeBuildInputs = (old.nativeBuildInputs or []) ++ [makeWrapper];
        postFixup = with config.colors.scheme.palette; ''
          wrapProgram $out/bin/slurp \
            --add-flags "-b \"#${base06}30\" -c \"#${base00}ff\""
        '';
      });
    in [
      brightnessctl
      cliphist
      customSlurp
      grim
      inputs'.shadower.packages.shadower
      libnotify
      libsForQt5.qtimageformats
      pavolume
      pavucontrol
      playerctl
      ripdrag
      satty
      swayidle
      vimiv-qt
      wev
      wl-clipboard
      wlr-randr
      ydotool

      (inputs'.hyprwm-contrib.packages.grimblast.override {
        slurp = customSlurp;
      })

      (writeScriptBin "scratchpad" ''
        export PATH=$PATH:${lib.makeBinPath [gawk]}
        ${scratchpad}/bin/scratchpad "$@"
      '')

      (wf-recorder.overrideAttrs {
        src = fetchFromGitHub {
          owner = "ammen99";
          repo = "wf-recorder";
          rev = "060ddc50268a775419f19d2403fdcfd8b985564b";
          hash = "sha256-TAFUwHLaA/zsTBiR2qqwcv8NCIaHWnBm7LsnI1fo/o4=";
        };
      })
    ];
  };
}
