{
  config,
  lib,
  ...
}: let
  cfg = config.customPrograms.terminal.irssi;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.customPrograms.terminal.irssi = {
    enable = mkEnableOption "";

    nick = mkOption {
      default = "ErrorNoInternet";
      type = types.str;
    };

    realName = mkOption {
      default = "Ryan";
      type = types.str;
    };

    networks = mkOption {
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
    };
  };

  config = mkIf cfg.enable {
    programs.irssi = let
      fallback = a: b:
        if a != null
        then a
        else b;
    in {
      enable = true;

      extraConfig = ''
        settings = {
          core = {
            real_name = "${cfg.realName}";
          };
        };
      '';

      networks = builtins.listToAttrs (map (network: {
          name = fallback network.name network.address;
          value = {
            nick = fallback network.nick cfg.nick;
            server = {
              inherit (network) address port;
            };
          };
        })
        cfg.networks);
    };

    home.file.".irssi/default.theme".text = ''
      abstracts = {
        sb_background = "%4%k";
        sb_foreground = "%*";
      };
    '';
  };
}
