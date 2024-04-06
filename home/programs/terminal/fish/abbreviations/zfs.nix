{
  programs.fish.shellAbbrs = {
    ioz = "ioztat -x 1";
    iozx = "ioztat -xx 1";
    md = "sudo zpool import -al";
    zf = "zfs";
    zfg = "zfs get";
    zfgf = "zfs get -t filesystem";
    zfgs = "zfs get -t snapshot";
    zfl = "zfs list";
    zflk = "zfs load-key";
    zflka = "zfs load-key -a";
    zfls = "zfs list -t snapshot";
    zfm = "zfs mount -v";
    zfma = "zfs mount -val";
    zp = "zpool";
    zpg = "zpool get";
    zpi = "zpool import";
    zpia = "zpool import -al";
    zpio = "zpool iostat -v 1";
    zpiol = "zpool iostat -vl 1";
    zpl = "zpool list";
    zplv = "zpool list -v";
    zps = "zpool status";
    zpss = "zpool status -s";
    zpst = "zpool status -t";
    zpstv = "zpool status -tv";
    zpsv = "zpool status -v";
  };
}
