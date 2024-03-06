{
  config,
  lib,
  ...
}: let
  inherit (lib) attrsets strings;
in {
  programs.fish.shellAliases =
    {
      q =
        (strings.optionalString config.flags.nixOnDroid
          "if [ \"$SSH_AGENT_LAUNCHED\" = 1 ]; killall ssh-agent; end;")
        + "exit";

      cm = "cmatrix -C blue";
      drg = "ripdrag -xa";
      grep = "grep --color";
      ip = "ip --color";
      l = "ls -l";
      la = "ls -la";
      laT = "ls -laT";
      ll = "ls -l";
      ls = "eza --git --icons";
      lsimg = "timg -pk --grid=6 --upscale --title --center --frames=1";
      lT = "ls -lT";
      py = "python3";
      timg = "timg -pk";

      ff = "fastfetch";
      f = "fastfetch -c ${config.xdg.configHome}/fastfetch/minimal.jsonc";
      droidf = "fastfetch -c ${config.xdg.configHome}/fastfetch/minimal-droid.jsonc";

      B = "nh os boot .";
      Ba = "B -a";
      DSa = "DS -a";
      S = "nh os switch .";
      Sa = "S -a";
      T = "nh os test .";
      Ta = "T -a";

      H = "exec Hyprland";
      pp = "playerctl play-pause";
      ppc = "playerctl play";
      pps = "playerctl pause";
      pwdc = "pwd | tr -d '\\n' | wl-copy";
    }
    // (attrsets.optionalAttrs config.flags.nixOnDroid {
      ping = "/android/system/bin/linker64 /android/system/bin/ping";
      ping6 = "/android/system/bin/linker64 /android/system/bin/ping6";
    });
}
