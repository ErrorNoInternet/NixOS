args: {
  architectures = import ./architectures.nix args;

  autotools = import ./autotools.nix;

  c = import ./c.nix args;

  cmake = import ./cmake.nix;

  meson = import ./meson.nix;

  rust = import ./rust.nix args;
}
