{self, ...}: {
  flake.nixosConfigurations = with self.lib.systems; {
    NixBtw = mkHmWorkstation "NixBtw" "x86_64-linux";
    Rescanix = mkHmWorkstation "Rescanix" "x86_64-linux";
  };
}
