{self, ...}: {
  flake.nixosConfigurations = with self.lib.nixos; {
    NixBtw = mkWorkstation "NixBtw" "102f58f5" {};

    Rescanix = mkWorkstation "Rescanix" "3a1f6cc6" {};
  };
}