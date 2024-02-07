{pkgs, ...}: {
  programs.fish.interactiveShellInit = ''
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


    function un-store -d "turn a nix store symlink into a regular file"
      for argi in (seq 1 $(count $argv))
        set name $argv[$argi]
        mv $name $name.store
        cat $name.store > $name
      end
    end

    function re-store -d "turn a regular file back into a nix store symlink"
      for argi in (seq 1 $(count $argv))
        set name $argv[$argi]
        switch $name
        case "*.store"
        case "*"
          mv $name.store $name
        end
      end
    end

    function storesolve -d "recursively find the nix store path of a file"
      for argi in (seq 1 $(count $argv))
        set path $(readlink -f "$argv[$argi]")
        if [ ! -e "$path" ]
          set path $(which "$argv[$argi]")
        end

        while [ -L "$path" ]
          set path $(readlink -f "$path")
        end
        echo "$path"
      end
    end


    function ggr -d "fancy git history graph"
      ${pkgs.git-graph}/bin/git-graph --color always -s ascii --no-pager $argv | ${pkgs.less}/bin/less
    end


    function md
      read -P "[md] password for luks: " -s LUKS_PASSWORD

      echo "$LUKS_PASSWORD" | sudo cryptsetup luksOpen /dev/disk/by-uuid/9cbb87fd-6e5a-45b3-88ee-22d369738be5 luks-btank1
      and echo "$LUKS_PASSWORD" | sudo cryptsetup luksOpen /dev/disk/by-uuid/5e2dcefa-ad4c-43ec-b58c-5660051a4010 luks-btank2

      set -e LUKS_PASSWORD

      sudo mount /dev/mapper/luks-btank1 ~/data
    end
  '';
}
