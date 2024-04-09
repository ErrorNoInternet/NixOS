args: {
  architectures = import ./architectures.nix args;

  c = import ./c.nix args;

  meson = import ./meson.nix;

  rust = import ./rust.nix args;
}
