{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      yank
      nord
    ];
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    historyLimit = 100000;
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
    extraConfig = ''
      set -g allow-passthrough on
      set -g repeat-time 0
      set -g set-clipboard on
      set -ga terminal-overrides ",xterm*:RGB"
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM

      set -g pane-active-border-style 'fg=colour4'

      bind -n M-Left previous-window
      bind -n M-Right next-window
      bind -n S-Left previous-window
      bind -n S-Right next-window
      bind '"' split-window -v -c "#{pane_current_path}"
      bind '%' split-window -h -c "#{pane_current_path}"
      bind -T copy-mode-vi y send -X copy-pipe-and-cancel 'wl-copy'
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi C-v send -X rectangle-toggle
      bind -T copy-mode-vi C-Left send -X previous-word
      bind -T copy-mode-vi C-Right send -X next-word
      bind -T copy-mode-vi 'Home' send -X start-of-line
      bind -T copy-mode-vi 'End'  send -X end-of-line
    '';
  };
}
