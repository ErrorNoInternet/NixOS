{ pkgs, ... }:
{
  programs.yazi.settings = {
    open.rules = [
      {
        mime = "text/*";
        use = [
          "edit"
          "reveal"
        ];
      }
      {
        mime = "image/*";
        use = [
          "open"
          "reveal"
        ];
      }
      {
        mime = "video/*";
        use = [
          "play"
          "reveal"
        ];
      }
      {
        mime = "audio/*";
        use = [
          "play"
          "reveal"
        ];
      }
      {
        mime = "inode/x-empty";
        use = [
          "edit"
          "reveal"
        ];
      }
      {
        mime = "application/json";
        use = [
          "edit"
          "reveal"
        ];
      }
      {
        mime = "application/zip";
        use = [
          "extract"
          "reveal"
        ];
      }
      {
        mime = "application/gzip";
        use = [
          "extract"
          "reveal"
        ];
      }
      {
        mime = "application/x-tar";
        use = [
          "extract"
          "reveal"
        ];
      }
      {
        mime = "application/x-bzip";
        use = [
          "extract"
          "reveal"
        ];
      }
      {
        mime = "application/x-bzip2";
        use = [
          "extract"
          "reveal"
        ];
      }
      {
        mime = "application/x-7z-compressed";
        use = [
          "extract"
          "reveal"
        ];
      }
      {
        mime = "application/x-rar";
        use = [
          "extract"
          "reveal"
        ];
      }
      {
        mime = "application/*";
        use = [
          "open"
          "edit"
          "reveal"
        ];
      }
      {
        mime = "*";
        use = [
          "edit"
          "open"
          "reveal"
        ];
      }
    ];
    opener = {
      open = [ { exec = ''xdg-open "$@"''; } ];
      edit = [
        {
          exec = ''$EDITOR "$@"'';
          block = true;
        }
      ];
      reveal = [
        {
          exec = ''${pkgs.exiftool}/bin/exiftool "$1"; echo "press enter to exit"; read'';
          block = true;
        }
      ];
      extract = [ { exec = ''${pkgs.unar}/bin/unar "$1"''; } ];
      play = [
        {
          exec = ''${pkgs.mpv}/bin/mpv --force-window=yes "$@"'';
          orphan = true;
        }
        {
          exec = ''${pkgs.mediainfo}/bin/mediainfo "$1"; echo "press enter to exit"; read'';
          block = true;
        }
      ];
    };
  };
}
