{config, pkgs, ...}: {
  home.packages = with pkgs; [any-nix-shell];
  programs.fish = {
    enable = true;
    plugins = with pkgs; [
      {
        name = "tide";
        src = fishPlugins.tide.src;
      }
      {
        name = "autopair";
        src = fishPlugins.autopair.src;
      }
    ];
    shellAliases = {
      ls = "${pkgs.eza}/bin/eza --git --icons";
      l = "ls -l";
      ll = "ls -l";
      la = "ls -a";
      lla = "ls -la";
      grep = "grep --color";
      q = "exit";

      md = "sudo cryptsetup luksOpen /dev/disk/by-uuid/9cbb87fd-6e5a-45b3-88ee-22d369738be5 luks-btank && sudo mount /dev/mapper/luks-btank /mnt/data";
      nixos-switch = "sudo nixos-rebuild switch --flake .";
      home-switch = "home-manager switch --flake .";
      f = "${pkgs.fastfetch}/bin/fastfetch";
      mf = "${pkgs.fastfetch}/bin/fastfetch --load-config ~/.config/fastfetch/minimal.conf";
      mfa = "${pkgs.fastfetch}/bin/fastfetch --load-config ~/.config/fastfetch/nix-on-droid_minimal.conf";
      cm = "${pkgs.cmatrix}/bin/cmatrix -C blue";
      py = "python3";
      timg = "${pkgs.timg}/bin/timg -pk";
      lsimg = "${pkgs.timg}/bin/timg --grid=6 --upscale --title --center --frames=1";
      drg = "${pkgs.ripdrag}/bin/ripdrag -xa";
      cava = "TERM=${config.home.sessionVariables.TERMINAL} ${pkgs.cava}/bin/cava";
    };
    shellAbbrs = {
      s = "sudo";
      nv = "nvim";
      g = "git";
      gcl = "git clone";
      gd = "git diff";
      gdc = "git diff --cached";
      ga = "git add";
      gap = "git add -p";
      gc = "git commit -m";
      gca = "git commit --amend";
      gp = "git push";
      gl = "git log";
      gs = "git show";
      gr = "git restore";
      ns = "nix shell";
      nd = "nix develop -c fish";
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

      any-nix-shell fish --info-right | source
      if test (ps | grep fish | wc -l) -eq 1
        if test -e /android/system/bin/linker64
          mfa
        else
          mf
        end
      end
    '';
  };
}
