{self, ...}: {
  flake.nixosConfigurations = with self.lib.nixos; {
    NixBtw = mkWorkstation "NixBtw" "102f58f5" {};

    rescanix = mkWorkstation "rescanix" "3a1f6cc6" {};
  };
}
