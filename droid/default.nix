{self, ...}: {
  flake.nixOnDroidConfigurations = with self.lib.droid; {
    ErrorNoPhone = mkDroid "ErrorNoPhone";
  };
}
