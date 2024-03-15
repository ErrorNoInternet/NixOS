{self, ...}: {
  flake.nixosConfigurations = with self.lib.systems; {
    NixBtw = mkWorkstation "NixBtw" {disko = true;};
    Rescanix = mkWorkstation "Rescanix" {};
  };
}
