{lib, ...}: {
  c = import ./c {inherit lib;};

  meson = import ./meson.nix;

  rust = import ./rust.nix;
}
