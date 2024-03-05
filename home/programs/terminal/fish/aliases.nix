{ config, ... }:
{
  programs.fish.shellAliases = {
    H = "exec Hyprland";

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
    q = "exit";
    qq = "exit";
    timg = "timg -pk";

    ff = "fastfetch";
    f = "fastfetch -c ${config.xdg.configHome}/fastfetch/minimal.jsonc";
    droidf = "fastfetch -c ${config.xdg.configHome}/fastfetch/minimal-droid.jsonc";

    B = "nh os boot .";
    Ba = "B -a";
    S = "nh os switch .";
    Sa = "S -a";
    T = "nh os test .";
    Ta = "T -a";

    pp = "playerctl play-pause";
    ppc = "playerctl play";
    pps = "playerctl pause";
    pwdc = "pwd | tr -d '\\n' | wl-copy";
  };
}
