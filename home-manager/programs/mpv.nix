{
  programs.mpv = {
    enable = true;
    config = {
      no-keepaspect-window = "";

      demuxer-max-bytes = "150MiB";
      demuxer-max-back-bytes = "50MiB";

      sub-scale = 0.4;
      ytdl-raw-options = "write-auto-sub=";

      hwdec = "auto";
    };
  };
}
