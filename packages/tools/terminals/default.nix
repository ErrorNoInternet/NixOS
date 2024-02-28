{
  perSystem = {
    pkgs,
    system,
    ...
  }: {
    packages = with pkgs; {
      foot = callPackage ./foot {};
      kitty = callPackage ./kitty {};
      wezterm = callPackage ./wezterm {inherit system;};
    };
  };
}
