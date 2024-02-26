{
  systems = ["aarch64-linux" "x86_64-linux"];
  perSystem = {
    inputs',
    pkgs,
    system,
    ...
  }: {
    packages = with pkgs; {
      foot = callPackage ./foot {};
      kitty = callPackage ./kitty {};
      wezterm = callPackage ./wezterm {inherit inputs' system;};
    };
  };
}
