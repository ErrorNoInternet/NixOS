{
  ErrorNoBinaries = {
    substituters = {
      internal = ["http://192.168.0.100:7454/ErrorNoBinaries"];
      external = ["https://errornointernet.dynv6.net:7455/ErrorNoBinaries"];
      cachix = ["https://errornobinaries.cachix.org"];
    };
    publicKeys = [
      "ErrorNoBinaries:im2fJ1t41XAwp2S+DMgSI0VFKxS+jpz/XIOs/s9iLFg="
      "errornobinaries.cachix.org-1:84oagGNCIsXxBTYmfTiP+lvWje7lIS294iqAtCpFsbU="
    ];
  };

  locations = {
    china = {
      substituters = ["https://mirrors.ustc.edu.cn/nix-channels/store"];
      publicKeys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="];
    };
  };
}
