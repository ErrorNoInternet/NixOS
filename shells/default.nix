{
  imports = [
    ./rust.nix
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
        delta
        git
        inputs'.agenix.packages.default
        self'.formatter
        self'.packages.neovim
        self'.packages.nix
        statix
      ];
    };
  };
}
