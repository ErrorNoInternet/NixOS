{
  config,
  inputs',
  lib,
  pkgs,
  system,
  ...
}: let
  cfg = config.profiles.development;
  inherit (lib) mkEnableOption mkIf attrsets;
in {
  imports = [
    ./clang-format.nix
    ./clangd.nix
  ];

  options.profiles.development.enable =
    mkEnableOption "" // {default = true;};

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; let
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
      in [
        evcxr
        rust

        clang
        clang-tools
        cmake
        gdb
        glibc.static
        libllvm
        lldb
        pkg-config
        valgrind

        (python3.withPackages (ps:
          with ps; [
            jedi
            requests
          ]))
        black
        python3Packages.bpython

        alejandra
        attic
        cachix
        deadnix
        hydra-check
        nix-output-monitor
        nix-top
        nix-tree
        nvd
        statix

        gnumake
        go
        hyperfine
        linuxPackages_latest.perf
        man-pages
        onefetch
        scc
        zig
      ];

      sessionVariables = {
        GOPATH = "${config.home.homeDirectory}/.go";
      };
    };

    programs.fish = {
      shellAliases = attrsets.optionalAttrs (system == "x86_64-linux") {
        objdump = "objdump -M intel";
      };

      interactiveShellInit = ''
        function scc
          command scc --no-cocomo $argv | head -c-1
        end
      '';
    };
  };
}
