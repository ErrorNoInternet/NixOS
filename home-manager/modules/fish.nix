{ pkgs, ... }:

{
  home.packages = with pkgs; [ any-nix-shell ];
  programs.fish = {
    enable = true;
    plugins = with pkgs; [
      { name = "tide"; src = fishPlugins.tide.src; }
    ];
    shellAliases = {
      ls = "eza --git --icons";
      l = "ls -l";
      ll = "ls -l";
      la = "ls -a";
      lla = "ls -al";
      grep = "grep --color";

      md = "sudo cryptsetup luksOpen /dev/disk/by-uuid/9cbb87fd-6e5a-45b3-88ee-22d369738be5 luks-btank && sudo mount /dev/mapper/luks-btank /mnt/data";
      nixos-switch = "sudo nixos-rebuild switch --flake .";
      home-switch = "home-manager switch --flake .";
      f = "fastfetch";
      mf = "fastfetch --load-config ~/.config/fastfetch/minimal.conf";
      cm = "cmatrix -C blue";
      py = "python3";
      timg = "timg -pk";
      lsimg = "timg --grid=6 --upscale --title --center --frames=1";
      drg = "ripdrag -xa";
      cava = "TERM=kitty cava";
    };
    shellAbbrs = {
      g = "git";
    };
    shellInit = ''
      set -U fish_greeting
    '';
    interactiveShellInit = ''
      export _ZO_RESOLVE_SYMLINKS=1

      bind \cH backward-kill-word
      bind \e\[3\;5~ kill-word

      set tide_pwd_color_dirs blue
      set tide_pwd_color_anchors blue
      set tide_character_color blue
      set tide_time_color cyan

      any-nix-shell fish --info-right | source
      mf
    '';
  };
}
