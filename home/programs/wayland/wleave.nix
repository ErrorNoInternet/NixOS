{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkOption mkIf types;
in {
  options.home.programs.wayland.wleave = {
    sleep = mkOption {
      default = 0.25;
      type = types.float;
    };

    height = mkOption {
      default = 0.5;
      type = types.numbers.between 0 1;
    };
  };

  config = mkIf config.profiles.windowManager.enable {
    programs.wlogout = with config.home.programs.wayland.wleave;
    with config.colorScheme.colors; {
      enable = true;
      package = pkgs.wleave;
      layout = [
        {
          label = "lock";
          text = "Lock";
          action = "sleep ${builtins.toString sleep} && swaylock --grace 0 --fade-in 1";
          keybind = "l";
          inherit height;
        }
        {
          label = "shutdown";
          text = "Shutdown";
          action = "sleep ${builtins.toString sleep} && systemctl poweroff";
          keybind = "s";
          inherit height;
        }
        {
          label = "logout";
          text = "Logout";
          action = "sleep ${builtins.toString sleep} && hyprctl dispatch exit";
          keybind = "e";
          inherit height;
        }
        {
          label = "reboot";
          text = "Reboot";
          action = "sleep ${builtins.toString sleep} && systemctl reboot";
          keybind = "r";
          inherit height;
        }
        {
          label = "suspend";
          text = "Suspend";
          action = "sleep ${builtins.toString sleep} && systemctl suspend";
          keybind = "u";
          inherit height;
        }
        {
          label = "hibernate";
          text = "Hibernate";
          action = "sleep ${builtins.toString sleep} && systemctl hibernate";
          keybind = "h";
          inherit height;
        }
      ];
      style = ''
        window {
          background-color: rgba(${builtins.toString (
          lib.intersperse ", " (
            inputs.nix-colors.lib.conversions.hexToRGB base00
          )
        )}, ${builtins.toString config.opacity.bar});
        }

        button {
          font-size: 18px;
          background-color: #${base01};
          color: #${base04};
          margin: 5px;
          border-radius: 15px;
        }

        button:active, button:focus, button:hover {
          background-color: #${base03};
          color: #${base0D};
          transition: all 0.2s ease-in-out;
        }
      '';
    };
  };
}
