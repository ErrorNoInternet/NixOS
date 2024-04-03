{self, ...}: {
  flake.nixosConfigurations = with self.lib.systems; {
    Crix = mkServer "Crix" "b5d99878" {};

    Pix = mkHmServer "Pix" "fc7ad223" {
      system = "aarch64-linux";
      disko = false;
    };
  };
}
