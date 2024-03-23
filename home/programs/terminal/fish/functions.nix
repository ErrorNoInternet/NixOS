{
  config,
  pkgs,
  lib,
  self',
  ...
}: {
  programs.fish.interactiveShellInit =
    ''
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


      function unS -d "turn a nix store symlink into a regular file"
        for argi in (seq 1 $(count $argv))
          set name $argv[$argi]
          mv $name $name.store
          cat $name.store > $name
          echo "$name -> $name.store"
        end
      end

      function uns -d "turn a nix store symlink into a regular file, then edit"
        for argi in (seq 1 $(count $argv))
          set name $argv[$argi]
          mv $name $name.store
          cat $name.store > $name
          echo "$name -> $name.store"
          $EDITOR $name
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
        command scc --no-cocomo --ci $argv | head -c-1
      end

      function ggr -d "fancy git history graph"
        ${pkgs.git-graph}/bin/git-graph --color always -s ascii --no-pager $argv 2> /dev/null | less -R
      end

      function glfzf -d "use fzf to preview git commits"
        git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" $argv | \
          fzf --ansi --no-sort --reverse --tiebreak=index --scroll-off=5 --preview-window=right:60% \
            --preview 'function preview; set commit (echo $argv | grep -o "[a-f0-9]\{7\}"); git show --color=always $commit | delta --width=(tput cols); end; preview {}' \
            --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,shift-down:preview-page-down,shift-up:preview-page-up,q:abort,ctrl-m:execute:
                    function show; set commit (echo \$argv | grep -o '[a-f0-9]\{7\}'); git show --color=always \$commit | delta --width=(tput cols) | less -R; end; show {}"
      end

      function notify-done -d "send a desktop notification when a command finishes running"
        $argv
        ${pkgs.libnotify}/bin/notify-send "Command finished" "<b>`$argv`</b> has exited with code $status."
      end

      function pmem -d "display virtual memory information about a process"
        for pid in (echo $argv | sed "s| |\n|g")
          echo $pid
          grep -E "Vm(RSS|Swap)" /proc/$pid/status | sed "s| ||g; s|kB||g" | hsize -fk r
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
    ''
    + lib.strings.optionalString config.flags.nixOnDroid ''
      function DS
        set tmpDir (mktemp -d)

        echo "$(tput bold)>$(tput sgr0) Building nix-on-droid configuration"
        nix build .#nixOnDroidConfigurations.\"$HOSTNAME\".activationPackage \
          --impure --show-trace -v --log-format internal-json -o $tmpDir/result &| nom --json

        if ! test -d $tmpDir/result
          return
        end

        argparse "a/ask" -- $argv
        if set -q _flag_ask
          read confirmation -n1 -P "$(tput bold)>$(tput sgr0) Activate the configuration?$(tput bold) [y/N]:$(tput sgr0) "
          if test "$confirmation" != "y" && test "$confirmation" != "Y"
            return
          end
        end

        $tmpDir/result/activate
        rm $tmpDir/result

        rmdir $tmpDir
      end
    '';
}
