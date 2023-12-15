{pkgs, ...}: {
  home.packages = [pkgs.fastfetch];
  home.file = {
    ".config/fastfetch/minimal.jsonc".text = ''
      {
        "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
        "logo": {
          "source": "nixos_small",
          "padding": {
            "left": 1,
            "right": 3
          }
        },
        "display": {
          "separator": " ",
          "keyWidth": 14
        },
        "modules": [
          {
            "type": "os",
            "key": " system  ",
            "format": "{2} {9} ({12})"
          },
          {
            "type": "kernel",
            "key": " kernel  ",
            "format": "{1} {2}"
          },
          {
            "type": "uptime",
            "key": " uptime  "
          },
          {
            "type": "command",
            "key": "󰆧 packages",
            "text": "(nix-store --query --requisites /run/current-system | wc -l | tr -d '\n') && echo ' (nix; /run/current-system)'"
          },
          {
            "type": "memory",
            "key": "󰍛 memory  "
          },
          {
            "type": "disk",
            "key": "󱥎 storage ",
            "format": "{1} / {2} ({3})",
            "folders": "/"
          },
          {
            "type": "custom",
            "format": "\u001B[37m  \u001B[36m  \u001B[35m  \u001B[34m  \u001B[33m  \u001B[32m  \u001B[31m  \u001B[30m"
          }
        ]
      }
    '';
    ".config/fastfetch/nix-on-droid_minimal.jsonc".text = ''
      {
        "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
        "logo": {
          "source": "nixos_old_small",
          "padding": {
            "left": 1,
            "right": 3
          }
        },
        "display": {
          "separator": " ",
          "keyWidth": 14
        },
        "modules": [
          {
            "type": "command",
            "key": " system  ",
            "text": "echo Android $(/android/system/bin/linker64 /android/system/bin/getprop ro.build.version.release)"
          },
          {
            "type": "kernel",
            "key": " kernel  ",
            "format": "{1} {2}"
          },
          {
            "type": "uptime",
            "key": " uptime  "
          },
          {
            "type": "command",
            "key": "󰆧 packages",
            "text": "(nix-store --query --requisites ~/.nix-profile | wc -l | tr -d '\n') && echo ' (nix; ~/.nix-profile)'"
          },
          {
            "type": "memory",
            "key": "󰍛 memory  "
          },
          {
            "type": "disk",
            "key": "󱥎 storage ",
            "format": "{1} / {2} ({3})",
            "folders": "/"
          },
          {
            "type": "custom",
            "format": "\u001B[37m  \u001B[36m  \u001B[35m  \u001B[34m  \u001B[33m  \u001B[32m  \u001B[31m  \u001B[30m"
          }
        ]
      }
    '';
    ".config/fastfetch/config.jsonc".text = ''
      {
        "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
        "modules": [
          "title",
          "separator",
          "os",
          "kernel",
          "uptime",
          "packages",
          "shell",
          "display",
          "wm",
          "theme",
          "icons",
          "cursor",
          "terminalfont",
          "terminal",
          "processes",
          "memory",
          {
            "type": "disk",
            "folders": "/"
          },
          "break",
          "colors"
        ]
      }
    '';
  };
}
