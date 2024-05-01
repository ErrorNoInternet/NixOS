{
  config,
  inputs,
  lib,
  ...
}: let
  cfg = config.customPrograms.swaync;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.swaync.enable =
    mkEnableOption "" // {default = config.profiles.windowManager.enable;};

  config = mkIf cfg.enable {
    services.swaync = {
      enable = true;

      settings = {
        timeout = 10;
        timeout-critical = 0;
        timeout-low = 5;

        fit-to-screen = true;
        hide-on-action = true;
        hide-on-clear = true;
        script-fail-notify = true;
        transition-time = 200;

        control-center-margin-bottom = 20;
        control-center-margin-right = 20;
        control-center-margin-top = 20;

        notification-body-image-height = 100;
        notification-body-image-width = 200;
        notification-icon-size = 64;
        notification-window-width = 400;

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

      style = with config.colors.scheme.palette; ''
        * {
          background: transparent;
          border-radius: 12px;
          box-shadow: none;
          font-family: ${config.font.name};
          font-size: 12px;
          font-weight: bold;
        }

        .control-center .notification-row:focus,
        .control-center .notification-row:hover {
          background: #${base00};
        }

        .notification-row {
          margin-right: -4px;
          margin-top: 2px;
          outline: none;
          padding: 0px;
        }

        .notification {
          background: rgba(${
          inputs.nix-colors.lib.conversions.hexToRGBString "," base01
        },${builtins.toString config.opacity.notification});
          margin: 0px;
          padding: 0px;
        }

        .notification-content {
          background: rgba(${
          inputs.nix-colors.lib.conversions.hexToRGBString "," base01
        },${builtins.toString config.opacity.notification});
          border: 1px solid #${base0F};
          margin: 0px;
          padding: 10px;
        }

        .control-center-list-placeholder {
          color: #${base03};
          opacity: 1;
        }

        .critical {
          background: #${base01};
        }

        .notification-default-action {
          margin: 0px;
          padding: 0px;
        }

        .close-button {
          background: #${base08};
          color: #${base00};
          margin-right: 5px;
          margin-top: 5px;
          padding: 0px;
          text-shadow: none;
        }

        .close-button:hover {
          background: #${base08};
          border: none;
          box-shadow: none;
          transition: all 0.15s ease-in-out;
        }

        .notification-action {
          border-top: none;
          border: 0px;
        }

        .notification-default-action:hover,
        .notification-action:hover {
          background: #${base01};
        }

        .inline-reply {
          margin-top: 8px;
        }

        .inline-reply-entry {
          background: #${base00};
          border: 1px solid #${base00};
          caret-color: #${base06};
          color: #${base06};
        }

        .inline-reply-button {
          background: #${base00};
          border: 1px solid #${base00};
          color: #${base06};
          margin-left: 4px;
        }

        .inline-reply-button:disabled {
          background: initial;
          border: 1px solid transparent;
          color: #${base04};
        }

        .inline-reply-button:hover {
          background: #${base00};
        }

        .body-image {
          margin-top: 6px;
        }

        .summary {
          color: #${base06};
          text-shadow: none;
        }

        .time {
          color: #${base06};
          margin-right: 28px;
          text-shadow: none;
        }

        .body {
          color: #${base06};
          font-weight: 400;
          text-shadow: none;
        }

        .control-center {
          background: #${base00};
          border: 2px solid #${base0F};
          box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
        }

        .widget-title {
          background: #${base02};
          color: #${base06};
          margin: 10px 10px 5px 10px;
          padding: 5px 10px;
        }

        .widget-title>button {
          background: #${base00};
          color: #${base06};
          text-shadow: none;
        }

        .widget-title>button:hover {
          background: #${base08};
          color: #${base00};
        }

        .widget-dnd {
          background: #${base02};
          color: #${base06};
          margin: 5px 10px 10px 10px;
          padding: 5px 10px;
        }

        .widget-dnd>switch {
          background: #${base00};
        }

        .widget-dnd>switch:checked {
          background: #${base0F};
        }

        .widget-dnd>switch slider {
          background: #${base02};
        }

        .widget-dnd>switch:checked slider {
          background: #${base02};
        }

        .widget-label {
          margin: 10px 10px 5px 10px;
        }

        .widget-label>label {
          color: #${base06};
        }

        .widget-mpris {
          background: #${base02};
          color: #${base06};
          margin: 10px;
          padding: 15px 10px 0px 10px;
        }
      '';
    };
  };
}
