{
  systems = ["aarch64-linux" "x86_64-linux"];
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    packages = with pkgs; {
      brightness = callPackage ./brightness.nix {};
      hyprgamemode = callPackage ./hyprgamemode.nix {};
      pavolume = callPackage ./pavolume.nix {};
      scratchpad = callPackage ./scratchpad {inherit inputs';};
    };
  };
}
