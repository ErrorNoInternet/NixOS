{
  nix = {
    substituters = [
      "http://192.168.0.100:7455/ErrorNoBinaries"
      "https://errornobinaries.cachix.org"
    ];
    trustedPublicKeys = [
      "ErrorNoBinaries:im2fJ1t41XAwp2S+DMgSI0VFKxS+jpz/XIOs/s9iLFg="
      "errornobinaries.cachix.org-1:84oagGNCIsXxBTYmfTiP+lvWje7lIS294iqAtCpFsbU="
    ];
  };
}
