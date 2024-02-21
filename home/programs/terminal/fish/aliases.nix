{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.fish.shellAliases = {
    H = "exec Hyprland";

    cm = "${pkgs.cmatrix}/bin/cmatrix -C blue";
    drg = "${lib.getExe pkgs.ripdrag} -xa";
    grep = "grep --color";
    ip = "ip --color";
    l = "ls -l";
    la = "ls -la";
    ll = "ls -l";
    ls = "${lib.getExe pkgs.eza} --git --icons";
    lsimg = "${lib.getExe pkgs.timg} -ps --grid=6 --upscale --title --center --frames=1";
    py = "python3";
    q = "exit";
    qq = "exit";
    scc = "${pkgs.scc}/bin/scc --no-cocomo --ci";
    timg = "${lib.getExe pkgs.timg} -ps";

    ff = "fastfetch";
    f = "fastfetch -c ${config.xdg.configHome}/fastfetch/minimal.jsonc";
    droidf = "fastfetch -c ${config.xdg.configHome}/fastfetch/minimal-droid.jsonc";

    B = "${lib.getExe pkgs.nh} os boot .";
    Ba = "B -a";
    S = "${lib.getExe pkgs.nh} os switch .";
    Sa = "S -a";
    T = "${lib.getExe pkgs.nh} os test .";
    Ta = "T -a";

    pwdc = "pwd | tr -d '\\n' | ${pkgs.wl-clipboard}/bin/wl-copy";
  };
}
