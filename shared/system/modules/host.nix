{
  lib,
  self,
  system,
  ...
}: let
  inherit (lib) mkOption types;
in {
  options.host = {
    name = mkOption {
      type = types.str;
    };

    id = mkOption {
      type = with types; nullOr str;
      default = null;
    };

    architecture = mkOption {
      inherit (self.lib.derivations.architectures) type;
      default =
        if system == "x86_64-linux"
        then "x86-64-v3"
        else if system == "aarch64-linux"
        then "generic"
        else null;
    };

    system = mkOption {
      type = types.str;
      readOnly = true;
      default = system;
    };
  };
}
