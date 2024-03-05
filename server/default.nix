{ self, ... }:
{
  flake.nixosConfigurations = with self.lib.systems; {
    Crix = mkServer "Crix" "x86_64-linux" { };
    Pix = mkHmServer "Pix" "aarch64-linux" { };
  };
}
