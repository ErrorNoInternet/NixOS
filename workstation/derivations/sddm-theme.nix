{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "aczw";
    repo = "sddm-theme-corners";
    rev = "a76d4517f163bbc7787f51ab074a0357bbf5e527";
    sha256 = "nqQdEdGDc8CHc8m5IypqvYSb4jPen8sH+tr0mMsz9ls=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./corners/* $out/
    cd $out/
    sed -i 's|Background="backgrounds/leaves.png"|Background="backgrounds/glacier.png"|' theme.conf
    sed -i 's|LoginButtonText="Login!!"|LoginButtonText="Login"|' theme.conf
  '';
}
