{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.irssi;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.customPrograms.irssi = {
    enable = mkEnableOption "";

    nick = mkOption {
      type = types.str;
      default = "ErrorNoInternet";
    };

    realName = mkOption {
      type = types.str;
      default = "Ryan";
    };

    networks = mkOption {
      type = types.listOf (types.submodule {
        options = {
          nick = mkOption {
            default = null;
            type = with types; nullOr str;
          };

          name = mkOption {
            default = null;
            type = with types; nullOr str;
          };

          address = mkOption {
            type = types.str;
          };

          port = mkOption {
            default = 6697;
            type = types.int;
          };
        };
      });
      default = [
        {
          name = "libera";
          address = "irc.libera.chat";
        }
        {
          name = "oftc";
          address = "irc.oftc.net";
        }
      ];
    };

    scripts = mkOption {
      type = with types; listOf str;
      default = [
        "adv_windowlist.pl"
        "crapbuster.pl"
      ];
    };

    startupCommands = mkOption {
      type = types.str;
      default = ''
        /format -delete awl_display_header
        /format awl_display_key \$N%n \$H\$C\$S
        /format awl_display_key_active (\$N%n) \$H%9\$C%n\$S
        /set awl_viewer off
      '';
    };
  };

  config = mkIf cfg.enable {
    programs.irssi = {
      enable = true;

      extraConfig = ''
        settings = {
          core = {
            real_name = "${cfg.realName}";
          };
        };
      '';

      networks = let
        fallback = a: b:
          if a != null
          then a
          else b;
      in
        builtins.listToAttrs (map (network: {
            name = fallback network.name network.address;
            value = {
              nick = fallback network.nick cfg.nick;
              server = {inherit (network) address port;};
            };
          })
          cfg.networks);
    };

    home.file =
      {
        ".irssi/startup".text = ''
          /load perl
          ${
            builtins.concatStringsSep "\n"
            (map (script: "/script load ${script}") cfg.scripts)
          }

          ${cfg.startupCommands}

          /clear
        '';

        ".irssi/default.theme".text = ''
          abstracts = {
            sb_background = "%4%k";
            sb_foreground = "%*";
          };
        '';
      }
      // (let
        scripts = "${pkgs.fetchFromGitHub {
          owner = "irssi";
          repo = "scripts.irssi.org";
          rev = "08e2b21e74909de5e88e36f2ddd5dc77b6a7f8cc";
          hash = "sha256-QMntf1ehA/7+bhPDV9KfPU4DJQJx1S8CULOflbIaHUI=";
        }}/scripts";
      in
        builtins.listToAttrs (map (script: {
            name = ".irssi/scripts/${script}";
            value.source = "${scripts}/${script}";
          })
          cfg.scripts));
  };
}
