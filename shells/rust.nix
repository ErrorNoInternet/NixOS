{
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    devShells = let
      targetsFull = [
        "aarch64-unknown-linux-gnu"
        "aarch64-unknown-linux-musl"
        "wasm32-wasi"
        "x86_64-unknown-linux-gnu"
        "x86_64-unknown-linux-musl"
      ];
      extensionsNightly = [
        "clippy-preview"
        "rust-analyzer-preview"
        "rust-src"
        "rustfmt-preview"
      ];
    in {
      rust-full = pkgs.mkShell {
        name = "rust-full";
        packages = [
          (inputs'.rust-overlay.packages.rust-nightly.override {
            targets = targetsFull;
            extensions = [
              "clippy"
              "rust-analyzer"
              "rust-src"
              "rustfmt"
            ];
          })
        ];
      };

      rust-nightly = pkgs.mkShell {
        name = "rust-nightly";
        packages = [
          (inputs'.rust-overlay.packages.rust-nightly.override {
            targets = [
              "x86_64-unknown-linux-gnu"
              "x86_64-unknown-linux-musl"
            ];
            extensions = extensionsNightly;
          })
        ];
      };

      rust-nightly-full = pkgs.mkShell {
        name = "rust-nightly-full";
        packages = [
          (inputs'.rust-overlay.packages.rust-nightly.override {
            targets = targetsFull;
            extensions = extensionsNightly;
          })
        ];
      };
    };
  };
}
