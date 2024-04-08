{
  config,
  lib,
  ...
}: let
  cfg = config.mimetypes;
  inherit (lib) mkEnableOption mkOption types attrsets;
in {
  options.mimetypes = {
    image = {
      enable = mkEnableOption "";

      opener = mkOption {
        default = "vimiv.desktop";
        type = types.str;
      };
    };
  };

  config.xdg.mimeApps = with cfg; {
    enable = true;

    defaultApplications = attrsets.optionalAttrs cfg.image.enable {
      "image/gif" = [image.opener];
      "image/jpeg" = [image.opener];
      "image/png" = [image.opener];
      "image/svg+xml" = [image.opener];
      "image/tiff" = [image.opener];
      "image/webp" = [image.opener];
    };
  };
}
