{self, ...}: {
  flake.nixosConfigurations = with self.lib.systems; {
    NixBtw = mkWorkstation "NixBtw" "x86_64-linux" {
      disko = true;
      allowUnfree = true;
      cudaSupport = true;
    };
    Rescanix = mkWorkstation "Rescanix" "x86_64-linux" {
      allowUnfree = true;
      cudaSupport = true;
    };
  };
}
