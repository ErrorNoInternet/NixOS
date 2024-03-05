{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.customPrograms.terminal.fish.enable {
    programs.tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        jump
        yank
      ];

      baseIndex = 1;
      clock24 = true;
      escapeTime = 0;
      historyLimit = 500000;
      keyMode = "vi";
      mouse = true;
      terminal = "tmux-256color";

      extraConfig = ''
        set -g status off
        set-hook -g after-new-window      'if "[ #{session_windows} -gt 1 ]" "set status on"'
        set-hook -g after-kill-pane       'if "[ #{session_windows} -lt 2 ]" "set status off"'
        set-hook -g pane-exited           'if "[ #{session_windows} -lt 2 ]" "set status off"'
        set-hook -g window-layout-changed 'if "[ #{session_windows} -lt 2 ]" "set status off"'

        set -ug status-bg
        set -g status-style bg=default
        set -g status-left "#[fg=blue,bg=default]#[fg=black,bg=blue,bold] #S #[fg=blue,bg=default,nobold,noitalics,nounderscore] "
        set -g status-right " #[fg=brightblack,bg=default,nobold,noitalics,nounderscore]#[fg=white,bg=brightblack] %Y-%m-%d \
        #[fg=white,bg=brightblack,nobold,noitalics,nounderscore]|#[fg=white,bg=brightblack] %H:%M \
        #[fg=blue,bg=brightblack,nobold,noitalics,nounderscore]#[fg=black,bg=blue,bold] #H #[fg=blue,bg=default,nobold]"
        set -g window-status-format "#[fg=brightblack,bg=default,nobold,noitalics,nounderscore]#[fg=white,bg=brightblack] #I \
        #[fg=white,bg=brightblack,nobold,noitalics,nounderscore]| #[fg=white,bg=brightblack]#W #F #[fg=brightblack,bg=default,nobold,noitalics,nounderscore]"
        set -g window-status-current-format "#[fg=cyan]#[bg=default]#[nobold]#[noitalics]#[nounderscore]#[fg=black,bg=cyan] #I \
        #[fg=black,bg=cyan,nobold,noitalics,nounderscore]| #[fg=black,bg=cyan]#W #F #[fg=cyan,bg=default,nobold,noitalics,nounderscore]"
        set -g pane-active-border-style 'fg=colour4'
        set -g @jump-bg-color '\e[0m\e[90m'
        set -g @jump-fg-color '\e[1m\e[33m'

        set -g allow-passthrough on
        set -g focus-events off
        set -g repeat-time 0
        set -g set-clipboard on
        set -ga terminal-overrides ",xterm*:RGB"
        set -ga update-environment TERM
        set -ga update-environment TERM_PROGRAM

        bind -n C-F3 set-option status
        bind '"' split-window -v -c "#{pane_current_path}"
        bind '%' split-window -h -c "#{pane_current_path}"
        bind -n M-Left previous-window
        bind -n M-Right next-window
        bind -n S-Left previous-window
        bind -n S-Right next-window
        bind -r -T prefix C-Down resize-pane -D 6
        bind -r -T prefix C-Left resize-pane -L 8
        bind -r -T prefix C-Right resize-pane -R 8
        bind -r -T prefix C-Up resize-pane -U 6
        bind -T copy-mode-vi 'End' send -X end-of-line
        bind -T copy-mode-vi 'Home' send -X start-of-line
        bind -T copy-mode-vi C-Left send -X previous-word
        bind -T copy-mode-vi C-Right send -X next-word
        bind -T copy-mode-vi C-v send -X rectangle-toggle
        bind -T copy-mode-vi v send -X begin-selection
        bind -T copy-mode-vi y send -X copy-pipe-and-cancel 'wl-copy'
      '';
    };
  };
}
