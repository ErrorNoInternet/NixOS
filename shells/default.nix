{
  imports = [
    ./rust.nix
    ./sandbox.nix
  ];

  perSystem = {
    inputs',
    pkgs,
    self',
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "configuration.nix";
      packages = with pkgs; [
        bat
        deadnix
        git
        inputs'.agenix.packages.default
        inputs'.disko.packages.default
        nix-output-monitor
        parted
        self'.formatter
        self'.packages.delta
        self'.packages.neovim-unwrapped
        self'.packages.nix
        self'.packages.tmux
        smartmontools
        statix
      ];
    };
  };
}
