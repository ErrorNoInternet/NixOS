{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.fish.shellAliases = with lib; let
    nh = "${getExe pkgs.nh}";
    playerctl = "${getExe pkgs.playerctl}";
    timg = "${getExe pkgs.timg}";
  in {
    H = "exec Hyprland";

    cm = "${pkgs.cmatrix}/bin/cmatrix -C blue";
    drg = "${lib.getExe pkgs.ripdrag} -xa";
    grep = "grep --color";
    ip = "ip --color";
    l = "ls -l";
    la = "ls -la";
    ll = "ls -l";
    ls = "${lib.getExe pkgs.eza} --git --icons";
    lsimg = "${timg} -ps --grid=6 --upscale --title --center --frames=1";
    py = "python3";
    q = "exit";
    qq = "exit";
    timg = "${timg} -ps";

    ff = "fastfetch";
    f = "fastfetch -c ${config.xdg.configHome}/fastfetch/minimal.jsonc";
    droidf = "fastfetch -c ${config.xdg.configHome}/fastfetch/minimal-droid.jsonc";

    B = "${nh} os boot .";
    Ba = "B -a";
    S = "${nh} os switch .";
    Sa = "S -a";
    T = "${nh} os test .";
    Ta = "T -a";

    pp = "${playerctl} play-pause";
    ppc = "${playerctl} play";
    pps = "${playerctl} pause";
    pwdc = "pwd | tr -d '\\n' | ${pkgs.wl-clipboard}/bin/wl-copy";
  };
}
