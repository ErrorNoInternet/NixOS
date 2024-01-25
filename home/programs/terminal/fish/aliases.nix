{
  lib,
  pkgs,
  ...
}: {
  programs.fish.shellAliases = {
    cm = "${pkgs.cmatrix}/bin/cmatrix -C blue";
    drg = "${lib.getExe pkgs.ripdrag} -xa";
    f = "${lib.getExe pkgs.fastfetch}";
    grep = "grep --color";
    ip = "ip --color";
    l = "ls -l";
    la = "ls -la";
    ll = "ls -l";
    ls = "${lib.getExe pkgs.eza} --git --icons";
    lsimg = "${lib.getExe pkgs.timg} -ps --grid=6 --upscale --title --center --frames=1";
    mf = "${lib.getExe pkgs.fastfetch} -c ~/.config/fastfetch/minimal.jsonc";
    mfd = "${lib.getExe pkgs.fastfetch} -c ~/.config/fastfetch/nix-on-droid_minimal.jsonc";
    nix = "nix --default-flake flake:nixpkgs";
    nom = "nom --default-flake flake:nixpkgs";
    py = "python3";
    q = "exit";
    scc = "${pkgs.scc}/bin/scc --no-cocomo";
    timg = "${lib.getExe pkgs.timg} -ps";

    nrb = "${lib.getExe pkgs.nh} os boot -v .";
    nrs = "${lib.getExe pkgs.nh} os switch -v .";
    nrt = "${lib.getExe pkgs.nh} os test -v .";

    clo = "curl -LO";
    pwdc = "pwd | tr -d '\\n' | ${pkgs.wl-clipboard}/bin/wl-copy";
  };
}
