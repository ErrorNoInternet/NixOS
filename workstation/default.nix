{self, ...}: {
  flake.nixosConfigurations = with self.lib.systems; {
    NixBtw = mkWorkstation "NixBtw" {};
    Rescanix = mkWorkstation "Rescanix" {};
  };
}
