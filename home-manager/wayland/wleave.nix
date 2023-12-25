{
  config,
  custom,
  inputs,
  lib,
  pkgs,
  ...
}: let
  sleep = "0.25";
in {
  programs.wlogout = {
    enable = true;
    package = pkgs.wleave;
    layout = [
      {
        label = "lock";
        text = "Lock";
        action = "sleep ${sleep} && custom-swaylock 0 1";
        keybind = "l";
        height = 0.5;
      }
      {
        label = "shutdown";
        text = "Shutdown";
        action = "sleep ${sleep} && systemctl poweroff";
        keybind = "s";
        height = 0.5;
      }
      {
        label = "logout";
        text = "Logout";
        action = "sleep ${sleep} && hyprctl dispatch exit";
        keybind = "e";
        height = 0.5;
      }
      {
        label = "reboot";
        text = "Reboot";
        action = "sleep ${sleep} && systemctl reboot";
        keybind = "r";
        height = 0.5;
      }
      {
        label = "suspend";
        text = "Suspend";
        action = "sleep ${sleep} && systemctl suspend";
        keybind = "u";
        height = 0.5;
      }
      {
        label = "hibernate";
        text = "Hibernate";
        action = "sleep ${sleep} && systemctl hibernate";
        keybind = "h";
        height = 0.5;
      }
    ];
    style = ''
      window {
        background-color: rgba(${builtins.toString (lib.intersperse ", " (inputs.nix-colors.lib.conversions.hexToRGB config.colorScheme.colors.base00))}, ${custom.opacity});
      }

      button {
        font-size: 18px;
        background-color: #${config.colorScheme.colors.base01};
        color: #${config.colorScheme.colors.base04};
        margin: 5px;
        border-radius: 15px;
      }

      button:active, button:focus, button:hover {
        background-color: #${config.colorScheme.colors.base03};
        color: #${config.colorScheme.colors.base0D};
        transition: all 0.2s ease-in-out;
      }
    '';
  };
}