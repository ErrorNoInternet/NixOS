{ pkgs, ... }:

{
  nix = {
    package = pkgs.nix;
    settings.substituters = [
       "https://mirror.sjtu.edu.cn/nix-channels/store"
    ];
  };
}
