{pkgs, ...}: {
  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [jedi]))
    clang
    clang-tools
    gdb
    go
    linuxPackages_latest.perf
    man-pages
    python3Packages.bpython
    rustup
  ];
}
