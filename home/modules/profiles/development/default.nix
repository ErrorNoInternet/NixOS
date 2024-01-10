{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [
    ./clang-format.nix
  ];

  options.profiles.development.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf config.profiles.development.enable {
    home = {
      packages = with pkgs; [
        (python3.withPackages (ps: with ps; [jedi]))
        cachix
        clang
        clang-tools
        gdb
        gnumake
        go
        inputs.attic.packages.${pkgs.system}.attic
        libllvm
        linuxPackages_latest.perf
        man-pages
        python3Packages.bpython
        rustup
        scc
        zig
      ];
      sessionVariables = {
        GOPATH = "~/.go";
      };
    };
  };
}
