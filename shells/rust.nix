{
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    devShells.rust-nightly = pkgs.mkShell {
      name = "rust-nightly-shell";
      packages = let
        rust = inputs'.rust-overlay.packages.rust-nightly.override {
          targets = [
            "x86_64-unknown-linux-gnu"
            "x86_64-unknown-linux-musl"
          ];
          extensions = [
            "clippy-preview"
            "rust-analyzer-preview"
            "rust-src"
            "rustfmt-preview"
          ];
        };
      in [
        rust
      ];
    };
  };
}
