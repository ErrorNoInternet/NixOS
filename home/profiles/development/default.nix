{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [
    ./clang-format.nix
    ./clangd.nix
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
        glibc.static
        gnumake
        go
        libllvm
        linuxPackages_latest.perf
        man-pages
        nix-output-monitor
        onefetch
        python3Packages.bpython
        rustup
        scc
        self.packages.${system}.attic
        zig
      ];
      sessionVariables = {
        GOPATH = "${config.home.homeDirectory}/.go";
      };
    };
  };
}
