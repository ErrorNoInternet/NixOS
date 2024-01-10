{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.home.programs.terminal.irssi = {
    enable = mkEnableOption "";

    nickname = mkOption {
      default = "ErrorNoInternet";
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
          nickname = mkOption {
            default = "${config.home.programs.terminal.irssi.nickname}";
            type = types.str;
          };

          name = mkOption {
            default = "${config.address}";
            type = types.str;
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

  config = mkIf config.home.programs.terminal.irssi.enable {
    programs.irssi = {
      enable = true;
      networks = builtins.listToAttrs (map (network: {
          name = "${network.name}";
          value = {
            nick = "${network.nickname}";
            server = {
              address = "${network.address}";
              port = network.port;
            };
          };
        })
        config.home.programs.terminal.irssi.networks);
    };
    home.file.".irssi/default.theme".text = ''
      abstracts = {
        sb_background = "%4%k";
        sb_foreground = "%*";
      };
    '';
  };
}
