{self, ...}: {
  imports = [
    ./fhs.nix
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
        customPkgs = import ../packages {
          inherit inputs' pkgs self system;
        };
      in [
        bat
        customPkgs.delta
        customPkgs.neovim-unwrapped
        customPkgs.nix
        customPkgs.tmux
        deadnix
        git
        inputs'.agenix.packages.default
        inputs'.disko.packages.default
        nix-output-monitor
        parted
        self'.formatter
        smartmontools
        statix
      ];
    };
  };
}
