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
      q = "exit";
      ls = "${pkgs.eza}/bin/eza --git --icons";
      l = "ls -l";
      ll = "ls -l";
      la = "ls -a";
      lla = "ls -la";
      grep = "grep --color";
      ip = "ip --color";
      nix = "nix --default-flake nixpkgs";

      md = "sudo cryptsetup luksOpen /dev/disk/by-uuid/9cbb87fd-6e5a-45b3-88ee-22d369738be5 luks-btank && sudo mount /dev/mapper/luks-btank /mnt/data";
      nrs = "${pkgs.nh}/bin/nh os switch -v .";
      nrt = "${pkgs.nh}/bin/nh os test -v .";
      f = "${pkgs.fastfetch}/bin/fastfetch";
      mf = "${pkgs.fastfetch}/bin/fastfetch -c ~/.config/fastfetch/minimal.jsonc";
      mfa = "${pkgs.fastfetch}/bin/fastfetch -c ~/.config/fastfetch/nix-on-droid_minimal.jsonc";
      cm = "${pkgs.cmatrix}/bin/cmatrix -C blue";
      py = "python3";
      timg = "${pkgs.timg}/bin/timg -ps";
      lsimg = "${pkgs.timg}/bin/timg -ps --grid=6 --upscale --title --center --frames=1";
      drg = "${pkgs.ripdrag}/bin/ripdrag -xa";
      cava = "TERM=${custom.terminal} ${pkgs.cava}/bin/cava";
    };
    shellAbbrs = {
      s = "sudo";
      nv = "nvim";
      pwdc = "pwd | tr -d '\\n' | wl-copy";

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
