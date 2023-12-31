{
  custom,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    plugins = with pkgs.fishPlugins; [
      {
        name = "tide";
        src = tide.src;
      }
      {
        name = "autopair";
        src = autopair.src;
      }
    ];
    shellAliases = {
      cava = "TERM=${custom.terminal} ${pkgs.cava}/bin/cava";
      cm = "${pkgs.cmatrix}/bin/cmatrix -C blue";
      drg = "${pkgs.ripdrag}/bin/ripdrag -xa";
      f = "${pkgs.fastfetch}/bin/fastfetch";
      grep = "grep --color";
      ip = "ip --color";
      l = "ls -l";
      la = "ls -a";
      ll = "ls -l";
      lla = "ls -la";
      ls = "${pkgs.eza}/bin/eza --git --icons";
      lsimg = "${pkgs.timg}/bin/timg -ps --grid=6 --upscale --title --center --frames=1";
      mf = "${pkgs.fastfetch}/bin/fastfetch -c ~/.config/fastfetch/minimal.jsonc";
      mfa = "${pkgs.fastfetch}/bin/fastfetch -c ~/.config/fastfetch/nix-on-droid_minimal.jsonc";
      nix = "nix --default-flake flake:nixpkgs";
      py = "python3";
      q = "exit";
      timg = "${pkgs.timg}/bin/timg -ps";

      md = "sudo cryptsetup luksOpen /dev/disk/by-uuid/9cbb87fd-6e5a-45b3-88ee-22d369738be5 luks-btank && sudo mount /dev/mapper/luks-btank /mnt/data";
      nrs = "${pkgs.nh}/bin/nh os switch -v .";
      nrt = "${pkgs.nh}/bin/nh os test -v .";
      pwdc = "pwd | tr -d '\\n' | wl-copy";
      ggr = "${pkgs.git-graph}/bin/git-graph --color always --no-pager | ${pkgs.less}/bin/less";
    };
    shellAbbrs = {
      s = "sudo";
      nv = "nvim";

      nd = "nix develop -c fish";
      nr = "nix run";
      ns = "nix shell";

      g = "git";
      ga = "git add";
      gap = "git add -p";
      gb = "git branch";
      gbl = "git blame";
      gc = "git commit -m";
      gca = "git commit --amend";
      gcf = "git clean -f";
      gcl = "git clone";
      gco = "git checkout";
      gd = "git diff";
      gdc = "git diff --compact-summary";
      gds = "git diff --staged";
      gl = "git log";
      gp = "git push";
      gpl = "git pull";
      gr = "git restore";
      gre = "git reset";
      gs = "git show";
      gst = "git status";
    };
    shellInit = ''
      set -U fish_greeting
    '';
    interactiveShellInit = ''
      export _ZO_RESOLVE_SYMLINKS=1

      bind \cH backward-kill-word
      bind \e\[3\;5~ kill-word

      set fish_cursor_default line
      set tide_color_truncated_dirs blue
      set tide_pwd_color_truncated_dirs blue
      set tide_pwd_color_dirs blue
      set tide_pwd_color_anchors blue
      set tide_character_color cyan
      set tide_time_color cyan

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

      if test (ps | grep fish | wc -l) -le 1
        if test -e /android/system/bin/linker64
          mfa
        else
          if test (tmux list-windows 2> /dev/null | wc -l) -le 1 && test (tmux list-panes 2> /dev/null | wc -l) -le 1
            mf
          end
        end
      end
    '';
  };
}
