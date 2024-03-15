{pkgs, ...}: {
  programs.yazi.settings = {
    open.rules = [
      {
        mime = "text/*";
        use = ["edit" "reveal"];
      }
      {
        mime = "image/*";
        use = ["open" "reveal"];
      }
      {
        mime = "video/*";
        use = ["play" "reveal"];
      }
      {
        mime = "audio/*";
        use = ["play" "reveal"];
      }
      {
        mime = "inode/x-empty";
        use = ["edit" "reveal"];
      }
      {
        mime = "application/json";
        use = ["edit" "reveal"];
      }
      {
        mime = "application/zip";
        use = ["extract" "reveal"];
      }
      {
        mime = "application/gzip";
        use = ["extract" "reveal"];
      }
      {
        mime = "application/x-tar";
        use = ["extract" "reveal"];
      }
      {
        mime = "application/x-bzip";
        use = ["extract" "reveal"];
      }
      {
        mime = "application/x-bzip2";
        use = ["extract" "reveal"];
      }
      {
        mime = "application/x-7z-compressed";
        use = ["extract" "reveal"];
      }
      {
        mime = "application/x-rar";
        use = ["extract" "reveal"];
      }
      {
        mime = "application/*";
        use = ["open" "edit" "reveal"];
      }
      {
        mime = "*";
        use = ["edit" "open" "reveal"];
      }
    ];
    opener = {
      open = [
        {run = ''xdg-open "$@"'';}
      ];
      edit = [
        {
          run = ''$EDITOR "$@"'';
          block = true;
        }
      ];
      reveal = [
        {
          run = ''${pkgs.exiftool}/bin/exiftool "$1"; echo "press enter to exit"; read'';
          block = true;
        }
      ];
      extract = [
        {run = ''${pkgs.unar}/bin/unar "$1"'';}
      ];
      play = [
        {
          run = ''${pkgs.mpv}/bin/mpv --force-window=yes "$@"'';
          orphan = true;
        }
        {
          run = ''${pkgs.mediainfo}/bin/mediainfo "$1"; echo "press enter to exit"; read'';
          block = true;
        }
      ];
    };
  };
}
