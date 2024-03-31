{self, ...}: {
  flake.nixosConfigurations = with self.lib.systems; {
    Crix = mkServer "Crix" {};
    Pix = mkHmServer "Pix" {
      disko = false;
      system = "aarch64-linux";
    };
  };
}
