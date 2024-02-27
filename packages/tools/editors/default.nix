{
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    packages = with pkgs; {
      neovim = callPackage ./neovim {inherit inputs';};
    };
  };
}
