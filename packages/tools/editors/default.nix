{
  systems = ["x86_64-linux" "aarch64-linux"];
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
