{
  config,
  lib,
  ...
}: {
  options = {
    mimeapps =  {
      image =  {
        enable = lib.mkEnableOption "";

        opener = lib.mkOption {
          default = "vimiv.desktop";
          type = lib.types.str;
        };
      };
    };
  };

  config = lib.mkIf config.mimeapps.image.enable {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "image/gif" = [config.mimeapps.image.opener];
        "image/jpeg" = [config.mimeapps.image.opener];
        "image/png" = [config.mimeapps.image.opener];
        "image/svg+xml" = [config.mimeapps.image.opener];
        "image/tiff" = [config.mimeapps.image.opener];
        "image/webp" = [config.mimeapps.image.opener];
      };
    };
  };
}
