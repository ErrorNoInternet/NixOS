{
  programs.fish.shellAbbrs = {
    zf = "zfs";
    zp = "zpool";

    zfg = "zfs get";
    zfgf = "zfs get -t filesystem";
    zfl = "zfs list";
    zfls = "zfs list -t snapshot";
    zpg = "zpool get";
    zpl = "zpool list";
    zplv = "zpool list -v";
    zps = "zpool status";
    zpsv = "zpool status -v";

    zflk = "zfs load-key -a";
    zfm = "zfs mount -a";
    zpi = "zpool import -al";
  };
}
