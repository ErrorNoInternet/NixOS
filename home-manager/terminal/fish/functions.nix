{pkgs, ...}: {
  programs.fish.interactiveShellInit = ''
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

    function unstore -d "turn a nix store symlink into a regular file"
      for argi in (seq 1 $(count $argv))
        set name $argv[$argi]
        mv $name $name.bak
        cat $name.bak > $name
      end
    end

    function ggr -d "fancy git history graph"
      ${pkgs.git-graph}/bin/git-graph --color always --no-pager $argv | ${pkgs.less}/bin/less
    end
  '';
}
