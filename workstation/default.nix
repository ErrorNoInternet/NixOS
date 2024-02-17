{self, ...}: {
  flake.nixosConfigurations = with self.lib.systems; {
    NixBtw = mkWorkstation "NixBtw" "x86_64-linux";
    Rescanix = mkWorkstation "Rescanix" "x86_64-linux";
  };
}
