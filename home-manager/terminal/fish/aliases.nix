{
  custom,
  pkgs,
  ...
}: {
  programs.fish.shellAliases = {
    cava = "TERM=${custom.terminal} ${pkgs.cava}/bin/cava";
    cm = "${pkgs.cmatrix}/bin/cmatrix -C blue";
    drg = "${pkgs.ripdrag}/bin/ripdrag -xa";
    f = "${pkgs.fastfetch}/bin/fastfetch";
    grep = "grep --color";
    ip = "ip --color";
    l = "ls -l";
    la = "ls -a";
    ll = "ls -l";
    lla = "ls -la";
    ls = "${pkgs.eza}/bin/eza --git --icons";
    lsimg = "${pkgs.timg}/bin/timg -ps --grid=6 --upscale --title --center --frames=1";
    mf = "${pkgs.fastfetch}/bin/fastfetch -c ~/.config/fastfetch/minimal.jsonc";
    mfa = "${pkgs.fastfetch}/bin/fastfetch -c ~/.config/fastfetch/nix-on-droid_minimal.jsonc";
    nix = "nix --default-flake flake:nixpkgs";
    py = "python3";
    q = "exit";
    timg = "${pkgs.timg}/bin/timg -ps";

    md = "sudo cryptsetup luksOpen /dev/disk/by-uuid/9cbb87fd-6e5a-45b3-88ee-22d369738be5 luks-btank && sudo mount /dev/mapper/luks-btank /mnt/data";
    nrs = "${pkgs.nh}/bin/nh os switch -v .";
    nrt = "${pkgs.nh}/bin/nh os test -v .";
    pwdc = "pwd | tr -d '\\n' | wl-copy";
  };
}
