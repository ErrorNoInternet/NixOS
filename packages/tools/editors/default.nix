{
  systems = ["aarch64-linux" "x86_64-linux"];
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
