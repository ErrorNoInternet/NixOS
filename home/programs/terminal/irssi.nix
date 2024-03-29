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

    home.file.".irssi/default.theme".text = ''
      abstracts = {
        sb_background = "%4%k";
        sb_foreground = "%*";
      };
    '';
  };
}
