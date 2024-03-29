{self, ...}: {
  flake.nixosConfigurations = with self.lib.systems; {
    Crix = mkServer "Crix" {};
    Pix = mkHmServer "Pix" {system = "aarch64-linux";};
  };
}
