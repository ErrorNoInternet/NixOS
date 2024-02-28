{
  programs.fish.shellAbbrs = {
    zf = "zfs";
    zp = "zpool";

    zfl = "zfs list";
    zfls = "zfs list -t snapshot";
    zpl = "zpool list";
    zplv = "zpool list -v";
    zps = "zpool status";
    zpsv = "zpool status -v";

    zflk = "zfs load-key -a";
    zfm = "zfs mount -a";
    zpi = "zpool import -al";
  };
}
