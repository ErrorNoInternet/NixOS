{
  lib,
  system,
  osConfig ? {},
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

    system = mkOption {
      type = types.str;
      default = system;
    };

    architecture = mkOption {
      type = with types; nullOr str;
      default =
        osConfig.host.architecture
        or (
          if system == "x86_64-linux"
          then "x86-64-v3"
          else if system == "aarch64-linux"
          then "generic"
          else null
        );
    };
  };
}
