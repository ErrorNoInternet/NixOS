let
  imageViewer = "vimiv.desktop";
in {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/gif" = [imageViewer];
      "image/jpeg" = [imageViewer];
      "image/png" = [imageViewer];
      "image/svg+xml" = [imageViewer];
      "image/tiff" = [imageViewer];
      "image/webp" = [imageViewer];
    };
  };
}
