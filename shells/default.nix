{self, ...}: {
  imports = [
    ./rust.nix
    ./sandbox.nix
  ];

  perSystem = {
    inputs',
    pkgs,
    self',
    system,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "configuration.nix";
      packages = with pkgs; let
        pkgsSelf = import ../packages {
          inherit inputs' pkgs self system;
        };
      in [
        bat
        deadnix
        git
        inputs'.agenix.packages.default
        inputs'.disko.packages.default
        nix-output-monitor
        parted
        pkgsSelf.delta
        pkgsSelf.neovim-unwrapped
        pkgsSelf.nix
        pkgsSelf.tmux
        self'.formatter
        smartmontools
        statix
      ];
    };
  };
}
