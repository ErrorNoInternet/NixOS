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
      name = "configuration.nix-shell";
      packages = with pkgs; [
        alejandra
        bat
        deadnix
        delta
        git
        inputs'.agenix.packages.default
        self'.packages.neovim
        self'.packages.nix
        statix
      ];
    };
  };
}
