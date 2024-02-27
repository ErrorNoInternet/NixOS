{
  fetchFromGitHub,
  stdenv,
}:
stdenv.mkDerivation {
  name = "btrfs-map-physical";

  src = fetchFromGitHub {
    owner = "osandov";
    repo = "osandov-linux";
    rev = "6e1611e352ab3a5ab520174b26f27f4271c580db";
    hash = "sha256-b7QjUR6uM4lu2N5+ZeX4ApRqK9a/rBpzsCGUlFW+NLk=";
  };

  buildPhase = ''
    $CC scripts/btrfs_map_physical.c -o btrfs-map-physical
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -a btrfs-map-physical $out/bin
  '';
}
