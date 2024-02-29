{
  inputs',
  lib,
  pkgs,
  self',
  ...
}: {
  programs.fish.interactiveShellInit = with lib; let
    delta = "${getExe pkgs.delta}";
    fzf = "${getExe pkgs.fzf}";
    hsize = "${inputs'.hsize.packages.hsize}/bin/hsize";
    less = "${getExe pkgs.less}";
    notify-send = "${getExe pkgs.libnotify}";
  in ''
    function toggle-comment
      set cursor (commandline --cursor)
      set cmd (commandline -b)
      if string match -qr '^#' $cmd
        set cursor (math $cursor - 2)
        if test $cursor -lt 0
          set cursor 0
        end
        set cmd (string replace -r '^# *' ''' $cmd)
      else
        set cursor (math $cursor + 2)
        set cmd (string join ' ' '#' $cmd)
      end
      commandline -- $cmd
      commandline --cursor $cursor
    end


    function uns -d "turn a nix store symlink into a regular file"
      for argi in (seq 1 $(count $argv))
        set name $argv[$argi]
        mv $name $name.store
        cat $name.store > $name
        echo "$name -> $name.store"
      end
    end

    function res -d "turn a regular file back into a nix store symlink"
      for argi in (seq 1 $(count $argv))
        set name $argv[$argi]
        switch $name
        case "*.store"
        case "*"
          mv $name.store $name
          echo "$name <- $name.store"
        end
      end
    end

    function storesolve -d "recursively find the nix store path of a file"
      argparse "d/directory" -- $argv

      for argi in (seq 1 (count $argv))
        set path (readlink -f "$argv[$argi]")
        if ! test -e "$path"
          set path (which "$argv[$argi]")
        end

        while test -L "$path"
          set path (readlink -f "$path")
        end

        if set -q _flag_directory
          while test (dirname "$path") != "/nix/store"
            set path (dirname "$path")
          end
        end

        echo "$path"
      end
    end


    function btrfs-map-physical
      sudo ${self'.packages.btrfs-map-physical}/bin/btrfs-map-physical $argv | column -ts\t
    end

    function scc
      ${pkgs.scc}/bin/scc --no-cocomo --ci $argv | head -c-1
    end

    function ggr -d "fancy git history graph"
      ${pkgs.git-graph}/bin/git-graph --color always -s ascii --no-pager $argv 2> /dev/null | ${less}
    end

    function glfzf -d "use fzf to preview git commits"
      git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" $argv | \
        ${fzf} --ansi --no-sort --reverse --tiebreak=index --scroll-off=5 --preview-window=right:60% \
          --preview 'function preview; set commit (echo $argv | grep -o "[a-f0-9]\{7\}"); git show --color=always $commit | ${delta} --width=(tput cols); end; preview {}' \
          --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,shift-down:preview-page-down,shift-up:preview-page-up,q:abort,ctrl-m:execute:
                  function show; set commit (echo \$argv | grep -o '[a-f0-9]\{7\}'); git show --color=always \$commit | ${delta} --width=(tput cols) | ${less} -R; end; show {}"
    end

    function notify-done -d "send a desktop notification when a command finishes running"
      $argv
      ${notify-send} "Command finished" "<b>`$argv`</b> has exited with code $status."
    end

    function pmem -d "display virtual memory information about a process"
      for pid in (echo $argv | sed "s| |\n|g")
        echo $pid
        grep -E "Vm(RSS|Swap)" /proc/$pid/status | sed "s| ||g; s|kB||g" | ${hsize} -fk r
      end
    end

    function bak -d "create a copy (.bak) of a file"
      for argi in (seq 1 $(count $argv))
        cp -aiv $argv[$argi]{,.bak}
      end
    end

    function mkcd -d "create a directory and set cwd"
      command mkdir $argv
      if test $status = 0
        switch $argv[(count $argv)]
          case '-*'

          case '*'
            cd $argv[(count $argv)]
            return
        end
      end
    end
  '';
}
