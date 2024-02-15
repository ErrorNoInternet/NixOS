{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.profiles.windowManager.enable {
    home.packages = [pkgs.swaynotificationcenter];

    home.file = {
      "${config.xdg.configHome}/swaync/config.json".text = builtins.toJSON {
        timeout = 10;
        timeout-critical = 0;
        timeout-low = 5;

        fit-to-screen = true;
        hide-on-action = true;
        hide-on-clear = false;
        script-fail-notify = true;
        transition-time = 200;

        control-center-margin-bottom = 10;
        control-center-margin-right = 10;
        control-center-margin-top = 10;

        notification-body-image-height = 100;
        notification-body-image-width = 200;
        notification-icon-size = 64;
        notification-window-width = 500;

        widgets = [
          "title"
          "dnd"
          "notifications"
          "mpris"
        ];
        widget-config = {
          title = {
            text = "Notifications";
            clear-all-button = true;
            button-text = "󰆴 Clear All";
          };
          dnd.text = "Do Not Disturb";
          label = {
            max-lines = 1;
            text = "Notifications";
          };
          mpris = {
            image-size = 96;
            image-radius = 8;
          };
        };
      };

      "${config.xdg.configHome}/swaync/style.css".text = with config.colors.scheme.palette; ''
        * {
            font-family: ${config.font.name};
            font-size: 14px;
            font-weight: bold;
        }

        .control-center .notification-row:focus,
        .control-center .notification-row:hover {
            opacity: 1;
            background: #${base00};
        }

        .notification-row {
            outline: none;
            margin: 10px;
            padding: 0;
        }

        .notification {
            background: transparent;
            padding: 0;
            margin: 0px;
        }

        .notification-content {
            background: #${base00};
            padding: 10px;
            border-radius: 10px;
            border: 2px solid #{};
            margin: 0;
        }

        .notification-default-action {
            margin: 0;
            padding: 0;
            border-radius: 10px;
        }

        .close-button {
            background: #${base08};
            color: #${base00};
            text-shadow: none;
            padding: 0;
            border-radius: 10px;
            margin-top: 5px;
            margin-right: 5px;
        }

        .close-button:hover {
            box-shadow: none;
            background: #${base08};
            transition: all 0.15s ease-in-out;
            border: none;
        }

        .notification-action {
            border: 2px solid #${base0D};
            border-top: none;
            border-radius: 10px;
        }

        .notification-default-action:hover,
        .notification-action:hover {
            color: #${base0D};
            background: #${base0D};
        }

        .notification-default-action {
            border-radius: 10px;
            margin: 0px;
        }

        .notification-default-action:not(:only-child) {
            border-bottom-left-radius: 7px;
            border-bottom-right-radius: 7px;
        }

        .notification-action:first-child {
            border-bottom-left-radius: 10px;
            background: #1b1b2b;
        }

        .notification-action:last-child {
            border-bottom-right-radius: 10px;
            background: #1b1b2b;
        }

        .inline-reply {
            margin-top: 8px;
        }

        .inline-reply-entry {
            background: #${base00};
            color: #${base06};
            caret-color: #${base06};
            border: 1px solid #${base00};
            border-radius: 10px;
        }

        .inline-reply-button {
            margin-left: 4px;
            background: #${base00};
            border: 1px solid #${base00};
            border-radius: 10px;
            color: #${base06};
        }

        .inline-reply-button:disabled {
            background: initial;
            color: #${base06}-disabled;
            border: 1px solid transparent;
        }

        .inline-reply-button:hover {
            background: #${base00};
        }

        .body-image {
            margin-top: 6px;
            border-radius: 10px;
        }

        .summary {
            font-weight: 700;
            background: transparent;
            color: #${base06};
            text-shadow: none;
        }

        .time {
            font-weight: 700;
            background: transparent;
            color: #${base06};
            text-shadow: none;
            margin-right: 18px;
        }

        .body {
            font-weight: 400;
            background: transparent;
            color: #${base06};
            text-shadow: none;
        }

        .control-center {
            background: #${base00};
            border: 2px solid #${base0D};
            border-radius: 10px;
        }

        .control-center-list {
            background: transparent;
        }

        .control-center-list-placeholder {
            opacity: 0.5;
        }

        .floating-notifications {
            background: transparent;
        }

        .blank-window {
            background: alpha(black, 0.1);
        }

        .widget-title {
            color: #${base0D};
            background: #${base00};
            padding: 5px 10px;
            margin: 10px 10px 5px 10px;
            border-radius: 10px;
        }

        .widget-title>button {
            color: #${base06};
            text-shadow: none;
            background: #${base00};
            box-shadow: none;
            border-radius: 10px;
        }

        .widget-title>button:hover {
            background: #${base08};
            color: #${base00};
        }

        .widget-dnd {
            background: #${base00};
            padding: 5px 10px;
            margin: 5px 10px 10px 10px;
            border-radius: 10px;
            color: #${base0D};
        }

        .widget-dnd>switch {
            border-radius: 10px;
            background: #${base0D};
        }

        .widget-dnd>switch:checked {
            background: #${base08};
            border: 1px solid #${base08};
        }

        .widget-dnd>switch slider {
            background: #${base00};
            border-radius: 10px;
        }

        .widget-dnd>switch:checked slider {
            background: #${base00};
            border-radius: 10px;
        }

        .widget-label {
            margin: 10px 10px 5px 10px;
        }

        .widget-label>label {
            color: #${base06};
        }

        .widget-mpris {
            color: #${base06};
            background: #${base00};
            padding: 10px;
            margin: 10px;
            border-radius: 10px;
        }

        .widget-mpris>box>button {
            border-radius: 10px;
        }

        .widget-mpris-player {
            padding: 5px;
        }

        .widget-mpris-title {
            font-weight: 700;
        }

        .widget-menubar>box>.menu-button-bar>button {
            border: none;
            background: transparent;
        }
      '';
    };
  };
}
