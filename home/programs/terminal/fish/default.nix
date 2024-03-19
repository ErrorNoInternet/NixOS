{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.terminal.fish;
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [
    ./abbreviations
    ./aliases.nix
    ./functions.nix
    ./keybinds.nix
    ./theme.nix
  ];

  options.customPrograms.terminal.fish.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      plugins = with pkgs.fishPlugins; [
        {
          name = "autopair";
          inherit (autopair) src;
        }
      ];

      interactiveShellInit =
        ''
          set -x _ZO_MAXAGE 20000
          set -x _ZO_RESOLVE_SYMLINKS 1
        ''
        + (lib.strings.optionalString config.flags.nixOnDroid ''
          if test "$SSH_AUTH_SOCK" = "/ssh-agent"
            if test (ps ax | grep ssh-agent | count) = 1
              set SSH_AGENT_LAUNCHED 1
              ssh-agent > /dev/null
            end
            set -e SSH_AUTH_SOCK
            set -Ux SSH_AUTH_SOCK (find /tmp -type s -name "agent.*")
          end
        '');
    };
  };
}
