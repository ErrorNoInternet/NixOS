{pkgs, ...}: {
  programs.yazi.keymap = {
    manager.keymap = [
      # yazi
      {
        on = ["<Esc>"];
        exec = "escape";
        desc = "Exit visual mode; clear selected; or cancel search";
      }
      {
        on = ["q"];
        exec = "quit";
        desc = "Exit the process";
      }
      {
        on = ["<C-q>"];
        exec = "close";
        desc = "Close the current tab; or quit if it is last tab";
      }
      {
        on = ["<C-z>"];
        exec = "suspend";
        desc = "Suspend the process";
      }

      # Navigation
      {
        on = ["k"];
        exec = "arrow -1";
        desc = "Move cursor up";
      }
      {
        on = ["j"];
        exec = "arrow 1";
        desc = "Move cursor down";
      }

      {
        on = ["K"];
        exec = "arrow -5";
        desc = "Move cursor up 5 lines";
      }
      {
        on = ["J"];
        exec = "arrow 5";
        desc = "Move cursor down 5 lines";
      }

      {
        on = ["<C-u>"];
        exec = "arrow -50%";
        desc = "Move cursor up half page";
      }
      {
        on = ["<C-d>"];
        exec = "arrow 50%";
        desc = "Move cursor down half page";
      }

      {
        on = ["h"];
        exec = "leave";
        desc = "Go back to the parent directory";
      }
      {
        on = ["l"];
        exec = "enter";
        desc = "Enter the child directory";
      }
      {
        on = ["H"];
        exec = "back";
        desc = "Go back to the previous directory";
      }
      {
        on = ["L"];
        exec = "forward";
        desc = "Go forward to the next directory";
      }
      {
        on = ["<C-k>"];
        exec = "seek -5";
        desc = "Peek up 5 units in the preview";
      }
      {
        on = ["<C-j>"];
        exec = "seek 5";
        desc = "Peek down 5 units in the preview";
      }

      {
        on = ["<Up>"];
        exec = "arrow -1";
        desc = "Move cursor up";
      }
      {
        on = ["<Down>"];
        exec = "arrow 1";
        desc = "Move cursor down";
      }
      {
        on = ["<Left>"];
        exec = "leave";
        desc = "Go back to the parent directory";
      }
      {
        on = ["<Right>"];
        exec = "enter";
        desc = "Enter the child directory";
      }
      {
        on = ["g" "g"];
        exec = "arrow -99999999";
        desc = "Move cursor to the top";
      }
      {
        on = ["G"];
        exec = "arrow 99999999";
        desc = "Move cursor to the bottom";
      }

      # Selection
      {
        on = ["<Space>"];
        exec = ["select --state=none" "arrow 1"];
        desc = "Toggle the current selection state";
      }
      {
        on = ["v"];
        exec = "visual_mode";
        desc = "Enter visual mode (selection mode)";
      }
      {
        on = ["V"];
        exec = "visual_mode --unset";
        desc = "Enter visual mode (unset mode)";
      }
      {
        on = ["<C-a>"];
        exec = "select_all --state=true";
        desc = "Select all files";
      }
      {
        on = ["<C-r>"];
        exec = "select_all --state=none";
        desc = "Inverse selection of all files";
      }

      # operations
      {
        on = ["o"];
        exec = "open";
        desc = "open the selected files";
      }
      {
        on = ["<Enter>"];
        exec = "open";
        desc = "open the selected files";
      }
      {
        on = ["y"];
        exec = "yank";
        desc = "copy the selected files";
      }
      {
        on = ["x"];
        exec = "yank --cut";
        desc = "cut the selected files";
      }
      {
        on = ["p"];
        exec = "paste";
        desc = "paste the files";
      }
      {
        on = ["P"];
        exec = "paste --force";
        desc = "paste the files (overwrite if the destination exists)";
      }
      {
        on = ["D"];
        exec = "remove";
        desc = "move the files to the trash";
      }
      {
        on = ["d"];
        exec = "remove --permanently";
        desc = "permanently delete the files";
      }
      {
        on = ["a"];
        exec = "create";
        desc = "create a file or directory (ends with / for directories)";
      }
      {
        on = ["r"];
        exec = "rename";
        desc = "rename a file or directory";
      }
      {
        on = ["R"];
        exec = "shell --confirm '${pkgs.ripdrag}/bin/ripdrag -xa \"$@\"'";
        desc = "drag files using ripdrag";
      }
      {
        on = [":"];
        exec = "shell --block";
        desc = "run a blocking shell command";
      }
      {
        on = ["."];
        exec = "hidden toggle";
        desc = "toggle hidden files";
      }
      {
        on = ["z"];
        exec = "jump zoxide";
        desc = "jump to a directory using zoxide";
      }
      {
        on = ["Z"];
        exec = "jump fzf";
        desc = "reveal files with fzf";
      }

      # Copy
      {
        on = ["c" "c"];
        exec = "copy path";
        desc = "copy the absolute path";
      }
      {
        on = ["c" "d"];
        exec = "copy dirname";
        desc = "copy parent directory path";
      }
      {
        on = ["c" "f"];
        exec = "copy filename";
        desc = "copy file name";
      }
      {
        on = ["c" "n"];
        exec = "copy name_without_ext";
        desc = "copy file name without extension";
      }

      # Find
      {
        on = ["/"];
        exec = "find";
      }
      {
        on = ["?"];
        exec = "find --previous";
      }
      {
        on = ["n"];
        exec = "find_arrow";
      }
      {
        on = ["N"];
        exec = "find_arrow --previous";
      }
      {
        on = ["s"];
        exec = "search fd";
      }
      {
        on = ["S"];
        exec = "search rg";
      }
      {
        on = ["<C-s>"];
        exec = "search none";
      }

      # Sorting
      {
        on = [";" "a"];
        exec = "sort alphabetical --dir-first";
        desc = "Sort alphabetically";
      }
      {
        on = [";" "A"];
        exec = "sort alphabetical --reverse --dir-first";
        desc = "Sort alphabetically (reverse)";
      }
      {
        on = [";" "c"];
        exec = "sort created --dir-first";
        desc = "Sort by creation time";
      }
      {
        on = [";" "C"];
        exec = "sort created --reverse --dir-first";
        desc = "Sort by creation time (reverse)";
      }
      {
        on = [";" "m"];
        exec = "sort modified --dir-first";
        desc = "Sort by modified time";
      }
      {
        on = [";" "M"];
        exec = "sort modified --reverse --dir-first";
        desc = "Sort by modified time (reverse)";
      }
      {
        on = [";" "n"];
        exec = "sort natural --dir-first";
        desc = "Sort naturally";
      }
      {
        on = [";" "N"];
        exec = "sort natural --reverse --dir-first";
        desc = "Sort naturally (reverse)";
      }
      {
        on = [";" "s"];
        exec = "sort size --dir-first";
        desc = "Sort by size";
      }
      {
        on = [";" "S"];
        exec = "sort size --reverse --dir-first";
        desc = "Sort by size (reverse)";
      }

      # Tabs
      {
        on = ["t"];
        exec = "tab_create --current";
        desc = "Create a new tab using the current path";
      }

      {
        on = ["1"];
        exec = "tab_switch 0";
        desc = "Switch to the first tab";
      }
      {
        on = ["2"];
        exec = "tab_switch 1";
        desc = "Switch to the second tab";
      }
      {
        on = ["3"];
        exec = "tab_switch 2";
        desc = "Switch to the third tab";
      }
      {
        on = ["4"];
        exec = "tab_switch 3";
        desc = "Switch to the fourth tab";
      }
      {
        on = ["5"];
        exec = "tab_switch 4";
        desc = "Switch to the fifth tab";
      }
      {
        on = ["6"];
        exec = "tab_switch 5";
        desc = "Switch to the sixth tab";
      }
      {
        on = ["7"];
        exec = "tab_switch 6";
        desc = "Switch to the seventh tab";
      }
      {
        on = ["8"];
        exec = "tab_switch 7";
        desc = "Switch to the eighth tab";
      }
      {
        on = ["9"];
        exec = "tab_switch 8";
        desc = "Switch to the ninth tab";
      }

      {
        on = ["["];
        exec = "tab_switch -1 --relative";
        desc = "Switch to the previous tab";
      }
      {
        on = ["]"];
        exec = "tab_switch 1 --relative";
        desc = "Switch to the next tab";
      }
      {
        on = ["{"];
        exec = "tab_swap -1";
        desc = "Swap the current tab with the previous tab";
      }
      {
        on = ["}"];
        exec = "tab_swap 1";
        desc = "Swap the current tab with the next tab";
      }

      # Tasks
      {
        on = ["w"];
        exec = "tasks_show";
        desc = "Show the tasks manager";
      }

      # Goto
      {
        on = ["g" "h"];
        exec = "cd ~";
        desc = "home";
      }
      {
        on = ["g" "c"];
        exec = "cd /etc/nixos/configuration.nix";
        desc = "configuration.nix";
      }
      {
        on = ["g" "d"];
        exec = "cd ~/data";
        desc = "data";
      }
      {
        on = ["g" "s"];
        exec = "cd ~/downloads";
        desc = "downloads";
      }
      {
        on = ["g" "t"];
        exec = "cd /tmp";
        desc = "tmp";
      }
      {
        on = ["g" "T"];
        exec = "cd ~/data/temporary/test-workspace";
        desc = "test-workspace";
      }
      {
        on = ["g" "<Space>"];
        exec = "cd --interactive";
        desc = "interactive";
      }
      {
        on = ["I"];
        exec = "plugin keyjump --sync";
        desc = "keyjump (normal mode)";
      }
      {
        on = ["i"];
        exec = "plugin keyjump --sync --args=keep";
        desc = "keyjump (keep mode)";
      }

      # Help
      {
        on = ["~"];
        exec = "help";
        desc = "Open help";
      }
    ];
  };
}
