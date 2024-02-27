{
  programs.fish.shellAbbrs = {
    zf = "zfs";
    zp = "zpool";

    zfl = "zfs list";
    zfls = "zfs list -t snapshot";
    zpl = "zpool list";
    zps = "zpool status";

    zflk = "zfs load-key -a";
    zfm = "zfs mount -a";
    zpi = "sudo zpool import -al";
  };
}
