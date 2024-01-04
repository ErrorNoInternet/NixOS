{pkgs, ...}: {
  imports = [
    ./abbreviations
    ./aliases.nix
    ./functions.nix
    ./keymaps.nix
    ./ui.nix
  ];

  programs.fish = {
    enable = true;
    plugins = with pkgs.fishPlugins; [
      {
        name = "autopair";
        src = autopair.src;
      }
    ];
    interactiveShellInit = ''
      set -x _ZO_RESOLVE_SYMLINKS 1

      if test (ps | grep fish | wc -l) -le 1
        if test -e /android/system/bin/linker64
          mfd
        else
          if test (tmux list-windows 2> /dev/null | wc -l) -le 1 &&
             test (tmux list-panes 2> /dev/null | wc -l) -le 1
            mf
          end
        end
      end
    '';
  };
}
