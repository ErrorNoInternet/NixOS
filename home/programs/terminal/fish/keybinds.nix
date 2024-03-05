{
  programs.fish.interactiveShellInit = ''
    bind \cH backward-kill-word
    bind \e\[3\;5~ kill-word

    bind \e\[1\;5A history-token-search-backward
    bind \e\[1\;5B history-token-search-forward

    bind \x1c toggle-comment
  '';
}
