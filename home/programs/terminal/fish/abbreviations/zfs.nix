{
  programs.fish.shellAbbrs = {
    ioz = "ioztat -x 1";
    iozx = "ioztat -xx 1";
    zf = "zfs";
    zfg = "zfs get";
    zfgf = "zfs get -t fs";
    zfgs = "zfs get -t snap";
    zfl = "zfs list";
    zflk = "zfs load-key";
    zflka = "zfs load-key -a";
    zflo = "zfs list -o";
    zflr = "zfs list -r";
    zflro = "zfs list -ro";
    zfls = "zfs list -t snap";
    zfm = "zfs mount -v";
    zfma = "zfs mount -val";
    zmd = "sudo zpool import -al";
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
