{
  programs.mpv = {
    enable = true;
    config = {
      no-keepaspect-window = "";

      demuxer-max-bytes = "75MiB";
      demuxer-max-back-bytes = "25MiB";

      sub-scale = 0.4;
      ytdl-raw-options = "write-auto-sub=";

      hwdec = "auto";
    };
  };
}
