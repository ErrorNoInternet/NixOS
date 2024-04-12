{self, ...}: {
  flake.nixosConfigurations = with self.lib.nixos; {
    msix = mkWorkstation "msix" "102f58f5" {};

    rescanix = mkWorkstation "rescanix" "3a1f6cc6" {};
  };
}
