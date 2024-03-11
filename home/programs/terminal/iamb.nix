{
  config,
  inputs',
  lib,
  ...
}: let
  cfg = config.customPrograms.terminal.iamb;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.customPrograms.terminal.iamb = {
    enable = mkEnableOption "";

    defaultProfile = mkOption {
      type = types.str;
      default = "default";
    };

    profiles = mkOption {
      type = types.listOf (types.submodule {
        options = {
          name = mkOption {
            type = types.str;
            default = "default";
          };

          userId = mkOption {
            type = types.str;
            default = "@errornointernet:envs.net";
          };

          homeserver = mkOption {
            type = types.str;
            default = "https://matrix.envs.net";
          };
        };
      });
      default = [{}];
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = [inputs'.iamb.packages.default];

      file."${config.xdg.configHome}/iamb/config.json".text = builtins.toJSON {
        settings = {
          log_level = "warn";
          reaction_display = true;
          reaction_shortcode_display = false;
          read_receipt_send = false;
          read_receipt_display = true;
          request_timeout = 15000;
          typing_notice_send = true;
          typing_notice_display = true;

          image_preview.size = {
            width = 40;
            height = 16;
          };
        };

        default_profile = cfg.defaultProfile;
        profiles = builtins.listToAttrs (map (profile: {
            inherit (profile) name;
            value = {
              user_id = profile.userId;
              url = profile.homeserver;
            };
          })
          cfg.profiles);

        dirs = let
          inherit (config.home) username;
        in {
          cache = "/home/${username}/.cache/iamb/";
          logs = "/home/${username}/.local/share/iamb/logs/";
          downloads = "/home/${username}/downloads/";
        };
      };
    };
  };
}
