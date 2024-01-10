{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.mimeapps = {
    image = {
      enable = mkEnableOption "";

      opener = mkOption {
        default = "vimiv.desktop";
        type = types.str;
      };
    };
  };

  config = mkIf config.mimeapps.image.enable {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = with config.mimeapps; {
        "image/gif" = [image.opener];
        "image/jpeg" = [image.opener];
        "image/png" = [image.opener];
        "image/svg+xml" = [image.opener];
        "image/tiff" = [image.opener];
        "image/webp" = [image.opener];
      };
    };
  };
}
