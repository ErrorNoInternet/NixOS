{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options.opacity = {
    normal = mkOption {
      default = 0.8;
      type = types.numbers.between 0 1;
    };

    subtle = mkOption {
      default = 0.9;
      type = types.numbers.between 0 1;
    };

    bar = mkOption {
      default = 0.7;
      type = types.numbers.between 0 1;
    };

    menu = mkOption {
      default = 0.3;
      type = types.numbers.between 0 1;
    };
  };
}
