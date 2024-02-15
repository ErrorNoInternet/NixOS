{
  systems = ["x86_64-linux" "aarch64-linux"];
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      brightness = callPackage ./brightness.nix {};
      hyprgamemode = callPackage ./hyprgamemode.nix {};
      pavolume = callPackage ./pavolume.nix {};
    };
  };
}
