{self, ...}: {
  flake.nixosConfigurations = with self.lib.nixos; {
    crix = mkServer "crix" "b5d99878" {};

    pix = mkHmServer "pix" "fc7ad223" {
      system = "aarch64-linux";
      disko = false;
    };
  };
}
