{
  programs.fish.interactiveShellInit = ''
    bind \cH backward-kill-word
    bind \e\[3\;5~ kill-word
  '';
}
