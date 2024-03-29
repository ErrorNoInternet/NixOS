{pkgs, ...}: {
  programs.yazi.keymap = {
    manager.keymap = [
      {
        on = ["<Esc>"];
        run = "escape";
        desc = "Exit visual mode; clear selected; or cancel search";
      }
      {
        on = ["q"];
        run = "quit";
        desc = "Exit the process";
      }
      {
        on = ["<C-q>"];
        run = "close";
        desc = "Close the current tab; or quit if it is last tab";
      }
      {
        on = ["<C-z>"];
        run = "suspend";
        desc = "Suspend the process";
      }

      {
        on = ["k"];
        run = "arrow -1";
        desc = "move selection up";
      }
      {
        on = ["j"];
        run = "arrow 1";
        desc = "move selection down";
      }

      {
        on = ["K"];
        run = "arrow -5";
        desc = "move selection up 5 lines";
      }
      {
        on = ["J"];
        run = "arrow 5";
        desc = "move selection down 5 lines";
      }

      {
        on = ["<C-u>"];
        run = "arrow -50%";
        desc = "move selection up half page";
      }
      {
        on = ["<C-d>"];
        run = "arrow 50%";
        desc = "move selection down half page";
      }

      {
        on = ["h"];
        run = "leave";
        desc = "go back to the parent directory";
      }
      {
        on = ["l"];
        run = "enter";
        desc = "enter the child directory";
      }
      {
        on = ["H"];
        run = "back";
        desc = "Go back to the previous directory";
      }
      {
        on = ["L"];
        run = "forward";
        desc = "Go forward to the next directory";
      }
      {
        on = ["<C-k>"];
        run = "seek -5";
        desc = "Peek up 5 units in the preview";
      }
      {
        on = ["<C-j>"];
        run = "seek 5";
        desc = "Peek down 5 units in the preview";
      }

      {
        on = ["<Up>"];
        run = "arrow -1";
        desc = "move selection up";
      }
      {
        on = ["<Down>"];
        run = "arrow 1";
        desc = "move selection down";
      }
      {
        on = ["<Left>"];
        run = "leave";
        desc = "Go back to the parent directory";
      }
      {
        on = ["<Right>"];
        run = "enter";
        desc = "Enter the child directory";
      }
      {
        on = ["g" "g"];
        run = "arrow -99999999";
        desc = "move selection to the top";
      }
      {
        on = ["G"];
        run = "arrow 99999999";
        desc = "move selection to the bottom";
      }

      {
        on = ["<Space>"];
        run = ["select --state=none" "arrow 1"];
        desc = "Toggle the current selection state";
      }
      {
        on = ["v"];
        run = "visual_mode";
        desc = "Enter visual mode (selection mode)";
      }
      {
        on = ["V"];
        run = "visual_mode --unset";
        desc = "Enter visual mode (unset mode)";
      }
      {
        on = ["<C-a>"];
        run = "select_all --state=true";
        desc = "Select all files";
      }
      {
        on = ["<C-r>"];
        run = "select_all --state=none";
        desc = "Inverse selection of all files";
      }

      {
        on = ["o"];
        run = "open";
        desc = "open the selected files";
      }
      {
        on = ["<Enter>"];
        run = "open";
        desc = "open the selected files";
      }
      {
        on = ["y"];
        run = "yank";
        desc = "copy the selected files";
      }
      {
        on = ["x"];
        run = "yank --cut";
        desc = "cut the selected files";
      }
      {
        on = ["p"];
        run = "paste";
        desc = "paste the files";
      }
      {
        on = ["P"];
        run = "paste --force";
        desc = "paste the files (overwrite if the destination exists)";
      }
      {
        on = ["D"];
        run = "remove";
        desc = "move the files to the trash";
      }
      {
        on = ["d"];
        run = "remove --permanently";
        desc = "permanently delete the files";
      }
      {
        on = ["a"];
        run = "create";
        desc = "create a file or directory (ends with / for directories)";
      }
      {
        on = ["r"];
        run = "rename";
        desc = "rename a file or directory";
      }
      {
        on = ["R"];
        run = "shell --confirm '${pkgs.ripdrag}/bin/ripdrag -xa \"$@\"'";
        desc = "drag files using ripdrag";
      }
      {
        on = [":"];
        run = "shell --block";
        desc = "run a blocking shell command";
      }
      {
        on = ["."];
        run = "hidden toggle";
        desc = "toggle hidden files";
      }
      {
        on = ["z"];
        run = "jump zoxide";
        desc = "jump to a directory using zoxide";
      }
      {
        on = ["Z"];
        run = "jump fzf";
        desc = "reveal files with fzf";
      }

      {
        on = ["c" "c"];
        run = "copy path";
        desc = "copy the absolute path";
      }
      {
        on = ["c" "d"];
        run = "copy dirname";
        desc = "copy parent directory path";
      }
      {
        on = ["c" "f"];
        run = "copy filename";
        desc = "copy file name";
      }
      {
        on = ["c" "n"];
        run = "copy name_without_ext";
        desc = "copy file name without extension";
      }

      {
        on = ["/"];
        run = "find";
      }
      {
        on = ["?"];
        run = "find --previous";
      }
      {
        on = ["n"];
        run = "find_arrow";
      }
      {
        on = ["N"];
        run = "find_arrow --previous";
      }
      {
        on = ["s"];
        run = "search fd";
      }
      {
        on = ["S"];
        run = "search rg";
      }
      {
        on = ["<C-s>"];
        run = "search none";
      }

      {
        on = [";" "a"];
        run = "sort alphabetical --dir-first";
        desc = "Sort alphabetically";
      }
      {
        on = [";" "A"];
        run = "sort alphabetical --reverse --dir-first";
        desc = "Sort alphabetically (reverse)";
      }
      {
        on = [";" "c"];
        run = "sort created --dir-first";
        desc = "Sort by creation time";
      }
      {
        on = [";" "C"];
        run = "sort created --reverse --dir-first";
        desc = "Sort by creation time (reverse)";
      }
      {
        on = [";" "m"];
        run = "sort modified --dir-first";
        desc = "Sort by modified time";
      }
      {
        on = [";" "M"];
        run = "sort modified --reverse --dir-first";
        desc = "Sort by modified time (reverse)";
      }
      {
        on = [";" "n"];
        run = "sort natural --dir-first";
        desc = "Sort naturally";
      }
      {
        on = [";" "N"];
        run = "sort natural --reverse --dir-first";
        desc = "Sort naturally (reverse)";
      }
      {
        on = [";" "s"];
        run = "sort size --dir-first";
        desc = "Sort by size";
      }
      {
        on = [";" "S"];
        run = "sort size --reverse --dir-first";
        desc = "Sort by size (reverse)";
      }

      {
        on = ["t"];
        run = "tab_create --current";
        desc = "Create a new tab using the current path";
      }

      {
        on = ["1"];
        run = "tab_switch 0";
        desc = "Switch to the first tab";
      }
      {
        on = ["2"];
        run = "tab_switch 1";
        desc = "Switch to the second tab";
      }
      {
        on = ["3"];
        run = "tab_switch 2";
        desc = "Switch to the third tab";
      }
      {
        on = ["4"];
        run = "tab_switch 3";
        desc = "Switch to the fourth tab";
      }
      {
        on = ["5"];
        run = "tab_switch 4";
        desc = "Switch to the fifth tab";
      }
      {
        on = ["6"];
        run = "tab_switch 5";
        desc = "Switch to the sixth tab";
      }
      {
        on = ["7"];
        run = "tab_switch 6";
        desc = "Switch to the seventh tab";
      }
      {
        on = ["8"];
        run = "tab_switch 7";
        desc = "Switch to the eighth tab";
      }
      {
        on = ["9"];
        run = "tab_switch 8";
        desc = "Switch to the ninth tab";
      }

      {
        on = ["["];
        run = "tab_switch -1 --relative";
        desc = "Switch to the previous tab";
      }
      {
        on = ["]"];
        run = "tab_switch 1 --relative";
        desc = "Switch to the next tab";
      }
      {
        on = ["{"];
        run = "tab_swap -1";
        desc = "Swap the current tab with the previous tab";
      }
      {
        on = ["}"];
        run = "tab_swap 1";
        desc = "Swap the current tab with the next tab";
      }

      {
        on = ["w"];
        run = "tasks_show";
        desc = "Show the tasks manager";
      }

      {
        on = ["g" "h"];
        run = "cd ~";
        desc = "home";
      }
      {
        on = ["g" "c"];
        run = "cd /etc/nixos/configuration.nix";
        desc = "configuration.nix";
      }
      {
        on = ["g" "d"];
        run = "cd ~/data";
        desc = "data";
      }
      {
        on = ["g" "s"];
        run = "cd ~/downloads";
        desc = "downloads";
      }
      {
        on = ["g" "M"];
        run = "cd ~/data/media";
        desc = "media";
      }
      {
        on = ["g" "m"];
        run = "cd /mnt";
        desc = "mnt";
      }
      {
        on = ["g" "t"];
        run = "cd ~/data/temporary/testing";
        desc = "testing";
      }
      {
        on = ["g" "<Space>"];
        run = "cd --interactive";
        desc = "interactive";
      }
      {
        on = ["i"];
        run = "plugin keyjump";
        desc = "keyjump (normal mode)";
      }
      {
        on = ["I"];
        run = "plugin keyjump --args=keep";
        desc = "keyjump (keep mode)";
      }
      {
        on = ["m"];
        run = "plugin bookmarks --args=save";
        desc = "mark current location";
      }
      {
        on = ["`"];
        run = "plugin bookmarks --args=jump";
        desc = "jump to marked location";
      }
      {
        on = ["b" "d"];
        run = "plugin bookmarks --args=delete";
        desc = "delete a marked location";
      }
      {
        on = ["b" "D"];
        run = "plugin bookmarks --args=delete_all";
        desc = "delete all marked locations";
      }

      {
        on = ["~"];
        run = "help";
        desc = "Open help";
      }
    ];
  };
}
