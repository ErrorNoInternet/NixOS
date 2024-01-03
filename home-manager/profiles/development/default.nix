{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./clang-format.nix
  ];

  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [jedi]))
    cachix
    clang
    clang-tools
    gdb
    go
    inputs.attic.packages.${pkgs.system}.attic
    libllvm
    linuxPackages_latest.perf
    man-pages
    python3Packages.bpython
    rustup
    zig
  ];
}
