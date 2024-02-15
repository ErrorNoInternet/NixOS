{
  systems = ["x86_64-linux" "aarch64-linux"];
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    packages = with pkgs; {
      kitty = callPackage ./kitty {};
      wezterm = callPackage ./wezterm {inherit inputs';};
    };
  };
}
