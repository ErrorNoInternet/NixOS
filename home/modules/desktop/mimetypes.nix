{
  config,
  lib,
  ...
}: let
  cfg = config.mimetypes;
  inherit (lib) mkEnableOption mkOption mkIf types attrsets;
in {
  options.mimetypes = {
    enable = mkEnableOption "";

    image = {
      enable = mkEnableOption "" // {default = true;};

      opener = mkOption {
        default = "vimiv.desktop";
        type = types.str;
      };
    };
  };

  config = mkIf cfg.enable {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = with cfg;
        attrsets.optionalAttrs image.enable {
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
