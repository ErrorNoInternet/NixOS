{
  programs.zsh = {
    enable = true;
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

      switch = "nix-on-droid switch --flake \".#$HOSTNAME\"";
      f = "neofetch --disable cpu";
      cm = "cmatrix -C blue";
      py = "python3";

      ping = "/android/system/bin/linker64 /android/system/bin/ping";
      nc = "ncat";
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
