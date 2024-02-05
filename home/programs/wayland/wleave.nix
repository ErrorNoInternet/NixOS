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
      default = 1.0;
      type = types.float;
    };

    height = mkOption {
      default = 0.5;
      type = types.numbers.between 0 1;
    };
  };

  config = mkIf config.profiles.windowManager.enable {
    programs.wlogout = with config.home.programs.wayland.wleave;
    with config.colors.scheme.palette; {
      enable = true;
      package = pkgs.wleave;
      layout = [
        {
          label = "suspend";
          text = "";
          action = "sleep ${builtins.toString sleep} && systemctl suspend";
          keybind = "s";
          inherit height;
        }
        {
          label = "reboot";
          text = "";
          action = "sleep ${builtins.toString sleep} && systemctl reboot";
          keybind = "r";
          inherit height;
        }
        {
          label = "shutdown";
          text = "";
          action = "sleep ${builtins.toString sleep} && systemctl poweroff";
          keybind = "p";
          inherit height;
        }
        {
          label = "logout";
          text = "󰗽";
          action = "sleep ${builtins.toString sleep} && hyprctl dispatch exit";
          keybind = "e";
          inherit height;
        }
        {
          label = "lock";
          text = "";
          action = "sleep ${builtins.toString sleep} && swaylock --grace 0 --fade-in 1";
          keybind = "l";
          inherit height;
        }
      ];
      style = ''
        window {
          background-color: rgba(${
          inputs.nix-colors.lib.conversions.hexToRGBString
          ","
          base00
        },${builtins.toString config.opacity.bar});
        }

        button {
          font-size: 72px;
          background-color: #${base01};
          color: #${base04};
          margin: 6px;
          border-radius: 16px;
        }

        button:hover {
          background-color: #${base03};
          color: #${base0D};
          transition: all 0.2s ease-in-out;
        }
      '';
    };
  };
}
