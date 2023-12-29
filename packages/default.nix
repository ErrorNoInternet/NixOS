{inputs, ...}: {
  systems = ["x86_64-linux" "aarch64-linux"];
  perSystem = {pkgs, ...}: {
    packages = {
      brightness = pkgs.callPackage ./brightness.nix {};
      passgen = pkgs.callPackage ./passgen.nix {};
      pavolume = pkgs.callPackage ./pavolume.nix {};
      savehw = pkgs.callPackage ./savehw.nix {};
      sddm-theme = pkgs.callPackage ./sddm-theme.nix {};
      tbw = pkgs.callPackage ./tbw.nix {};
    };
  };
}
