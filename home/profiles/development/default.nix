{
  config,
  inputs',
  lib,
  pkgs,
  self',
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
in
{
  imports = [
    ./clang-format.nix
    ./clangd.nix
  ];

  options.profiles.development.enable = mkEnableOption "" // {
    default = true;
  };

  config = mkIf config.profiles.development.enable {
    home = {
      packages =
        with pkgs;
        let
          rust = inputs'.rust-overlay.packages.rust.override {
            targets = [
              "aarch64-unknown-linux-gnu"
              "aarch64-unknown-linux-musl"
              "x86_64-unknown-linux-gnu"
              "x86_64-unknown-linux-musl"
            ];
            extensions = [
              "clippy"
              "rust-analyzer"
              "rust-src"
              "rustfmt"
            ];
          };
        in
        [
          clang
          clang-tools
          gdb
          glibc.static
          libllvm
          lldb
          pkg-config

          (python3.withPackages (ps: with ps; [ jedi ]))
          black
          python3Packages.bpython

          cachix
          nix-output-monitor
          nix-tree
          nvd
          self'.formatter
          self'.packages.attic

          gnumake
          go
          linuxPackages_latest.perf
          man-pages
          onefetch
          rust
          scc
          zig
        ];
      sessionVariables = {
        GOPATH = "${config.home.homeDirectory}/.go";
      };
    };
  };
}
