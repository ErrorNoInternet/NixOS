{
  nix.settings.substituters = [
    "https://mirror.sjtu.edu.cn/nix-channels/store"
  ];
  time.timeZone = "Asia/Shanghai";
  networking.extraHosts = ''
    185.199.111.133 raw.githubusercontent.com
  '';
}
