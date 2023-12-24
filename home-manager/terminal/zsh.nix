{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.7.0";
          sha256 = "149zh2rm59blr2q458a5irkfh82y3dwdich60s9670kl3cl5h2m1";
        };
      }
    ];
    zplug = {
      enable = true;
      plugins = [
        {name = "zsh-users/zsh-autosuggestions";}
        {name = "zsh-users/zsh-syntax-highlighting";}
        {
          name = "romkatv/powerlevel10k";
          tags = [as:theme depth:1];
        }
      ];
    };
    shellAliases = {
      ls = "eza --git --icons";
      l = "ls -l";
      ll = "ls -l";
      la = "ls -a";
      lla = "ls -al";
      grep = "grep --color";

      md = "sudo cryptsetup luksOpen /dev/disk/by-uuid/9cbb87fd-6e5a-45b3-88ee-22d369738be5 luks-btank && sudo mount /dev/mapper/luks-btank /mnt/data";
      switch = "sudo nixos-rebuild switch --flake .";
      home-switch = "home-manager switch --flake .";
      f = "fastfetch";
      cm = "cmatrix -C blue";
      py = "python3";
      timg = "timg -pk";
      lsimg = "timg --grid=6 --upscale --title --center --frames=1";
      drg = "ripdrag -xa";
      cava = "TERM=kitty cava";
    };
    history = {
      size = 100000;
      save = 100000;
    };
    enableCompletion = false;
    initExtraBeforeCompInit = ''
      zstyle ':completion:*' menu select
      zmodload zsh/complist
    '';
    initExtra = ''
      alias mf="fastfetch --load-config ~/.config/fastfetch/minimal.conf"
      if [ $(ps | grep gitstatusd | wc -l) -eq 0 ]; then
        mf && echo
      fi

      export _ZO_RESOLVE_SYMLINKS=1
      setopt appendhistory
      setopt interactivecomments
      setopt extendedglob

      typeset -g -A key
      key[Home]="''${terminfo[khome]}"
      key[End]="''${terminfo[kend]}"
      key[Insert]="''${terminfo[kich1]}"
      key[Backspace]="''${terminfo[kbs]}"
      key[Delete]="''${terminfo[kdch1]}"
      key[Up]="''${terminfo[kcuu1]}"
      key[Down]="''${terminfo[kcud1]}"
      key[Left]="''${terminfo[kcub1]}"
      key[Right]="''${terminfo[kcuf1]}"
      key[PageUp]="''${terminfo[kpp]}"
      key[PageDown]="''${terminfo[knp]}"
      key[Shift-Tab]="''${terminfo[kcbt]}"
      key[Control-Left]="''${terminfo[kLFT5]}"
      key[Control-Right]="''${terminfo[kRIT5]}"
      [[ -n "''${key[Home]}"        ]] && bindkey -- "''${key[Home]}"        beginning-of-line
      [[ -n "''${key[End]}"         ]] && bindkey -- "''${key[End]}"         end-of-line
      [[ -n "''${key[Insert]}"      ]] && bindkey -- "''${key[Insert]}"      overwrite-mode
      [[ -n "''${key[Backspace]}"     ]] && bindkey -- "''${key[Backspace]}"     backward-delete-char
      [[ -n "''${key[Delete]}"      ]] && bindkey -- "''${key[Delete]}"      delete-char
      [[ -n "''${key[Up]}"        ]] && bindkey -- "''${key[Up]}"        up-line-or-history
      [[ -n "''${key[Down]}"        ]] && bindkey -- "''${key[Down]}"        down-line-or-history
      [[ -n "''${key[Left]}"        ]] && bindkey -- "''${key[Left]}"        backward-char
      [[ -n "''${key[Right]}"       ]] && bindkey -- "''${key[Right]}"       forward-char
      [[ -n "''${key[PageUp]}"      ]] && bindkey -- "''${key[PageUp]}"      history-search-backward
      [[ -n "''${key[PageDown]}"      ]] && bindkey -- "''${key[PageDown]}"      history-search-forward
      [[ -n "''${key[Shift-Tab]}"     ]] && bindkey -- "''${key[Shift-Tab]}"     reverse-menu-complete
      [[ -n "''${key[Control-Left]}"    ]] && bindkey -- "''${key[Control-Left]}"    backward-word
      [[ -n "''${key[Control-Right]}"   ]] && bindkey -- "''${key[Control-Right]}"   forward-word
      if (( ''${+terminfo[smkx]} && ''${+terminfo[rmkx]} )); then
        autoload -Uz add-zle-hook-widget
        function zle_application_mode_start { echoti smkx }
        function zle_application_mode_stop { echoti rmkx }
        add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
        add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
      fi
      bindkey '^H' backward-kill-word
      bindkey '^[[3;5~' kill-word
      bindkey '^R' history-incremental-search-backward
    '';
  };
}
