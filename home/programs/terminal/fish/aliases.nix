{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.fish.shellAliases = {
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

    f = "fastfetch";
    mf = "fastfetch -c ${config.xdg.configHome}/fastfetch/minimal.jsonc";
    mfd = "fastfetch -c ${config.xdg.configHome}/fastfetch/nix-on-droid_minimal.jsonc";

    B = "${lib.getExe pkgs.nh} os boot . -v";
    Ba = "B -a";
    S = "${lib.getExe pkgs.nh} os switch . -v";
    Sa = "S -a";
    T = "${lib.getExe pkgs.nh} os test . -v";
    Ta = "T -a";

    pwdc = "pwd | tr -d '\\n' | ${pkgs.wl-clipboard}/bin/wl-copy";
  };
}
