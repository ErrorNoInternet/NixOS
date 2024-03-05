{ pkgs, ... }:
builtins.toJSON {
  "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
  logo = {
    source = "nixos_small";
    padding = {
      left = 1;
      right = 3;
    };
  };
  display = {
    separator = " ";
    keyWidth = 14;
  };
  modules =
    let
      commands.nix-store = "${pkgs.nix}/bin/nix-store";
    in
    [
      {
        type = "os";
        key = " system  ";
        format = "{3}";
      }
      {
        type = "kernel";
        key = " kernel  ";
        format = "{1} {2} ({4})";
      }
      {
        type = "uptime";
        key = " uptime  ";
      }
      {
        type = "command";
        key = "󰆧 packages";
        text = "(${commands.nix-store} --query --requisites /run/current-system | wc -l | tr -d '\n') && echo ' (nix; /run/current-system)'";
      }
      {
        type = "memory";
        key = "󰍛 memory  ";
      }
      {
        type = "disk";
        key = "󱥎 storage ";
        format = "{1} / {2} ({3})";
        folders = "/nix";
      }
      {
        type = "custom";
        format = "\\u001B[37m     \\u001B[36m     \\u001B[35m     \\u001B[34m     \\u001B[33m     \\u001B[32m     \\u001B[31m     \\u001B[30m";
      }
    ];
}
