{lib, ...}: {
  c = import ./c.nix {inherit lib;};

  meson = import ./meson.nix;

  rust = import ./rust.nix;
}