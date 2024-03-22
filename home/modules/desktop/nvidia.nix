{
  config,
  lib,
  ...
}: let
  cfg = config.nvidia.desktopEntries;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.nvidia.desktopEntries = {
    enable = mkEnableOption "";

    entries = mkOption {
      type = with types;
        listOf (submodule {
          options = {
            name = mkOption {type = str;};
            icon = mkOption {type = str;};
            command = mkOption {type = str;};
          };
        });
      default = [
        {
          name = "SuperTuxKart";
          icon = "supertuxkart";
          command = "supertuxkart";
        }
        {
          name = "osu!";
          icon = "osu!";
          command = "osu!";
        }
      ];
    };
  };

  config = mkIf cfg.enable {
    xdg.desktopEntries = builtins.listToAttrs (map (entry: {
        name = "nvidia-${entry.name}";
        value = {
          inherit (entry) name icon;
          exec = "nvidia-offload ${entry.command}";
          categories = ["Game"];
        };
      })
      cfg.entries);
  };
}
