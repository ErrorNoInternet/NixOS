{pkgs, ...}: {
  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [jedi]))
    clang
    clang-tools
    go
    python3Packages.bpython
    rustup
  ];
}
