{
  systems = ["x86_64-linux" "aarch64-linux"];
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      brightness = callPackage ./brightness.nix {};
      hyprgamemode = callPackage ./hyprgamemode.nix {};
      passgen = callPackage ./passgen.nix {};
      pavolume = callPackage ./pavolume.nix {};
      savehw = callPackage ./savehw.nix {};
      sddm-theme-corners = callPackage ./sddm-theme-corners.nix {};
      tbw = callPackage ./tbw.nix {};
    };
  };
}
