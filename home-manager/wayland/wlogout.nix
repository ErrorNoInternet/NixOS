{
  config,
  custom,
  lib,
  inputs,
  ...
}: let
  sleep = "0.25";
in {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        text = "Lock";
        action = "sleep ${sleep} && custom-swaylock 0 1";
        keybind = "l";
      }
      {
        label = "shutdown";
        text = "Shutdown";
        action = "sleep ${sleep} && systemctl poweroff";
        keybind = "s";
      }
      {
        label = "logout";
        text = "Logout";
        action = "sleep ${sleep} && hyprctl dispatch exit";
        keybind = "e";
      }
      {
        label = "reboot";
        text = "Reboot";
        action = "sleep ${sleep} && systemctl reboot";
        keybind = "r";
      }
      {
        label = "suspend";
        text = "Suspend";
        action = "sleep ${sleep} && systemctl suspend";
        keybind = "u";
      }
      {
        label = "hibernate";
        text = "Hibernate";
        action = "sleep ${sleep} && systemctl hibernate";
        keybind = "h";
      }
    ];
    style = ''
      window {
        background-color: rgba(${builtins.toString (lib.intersperse ", " (inputs.nix-colors.lib.conversions.hexToRGB config.colorScheme.colors.base00))}, ${custom.opacity});
      }

      button {
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
