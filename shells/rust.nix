{
  perSystem =
    { inputs', pkgs, ... }:
    {
      devShells.rust-nightly = pkgs.mkShell {
        name = "rust-nightly";
        packages =
          let
            rust = inputs'.rust-overlay.packages.rust-nightly.override {
              targets = [
                "aarch64-unknown-linux-gnu"
                "aarch64-unknown-linux-musl"
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
          in
          [ rust ];
      };
    };
}
