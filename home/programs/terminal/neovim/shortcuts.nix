{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      leap.enable = true;
      telescope.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-wordmotion

      vim-sort-motion
      vim-textobj-user
      (pkgs.vimUtils.buildVimPlugin {
        pname = "vim-textobj-indent";
        version = "2023-01-18";
        src = pkgs.fetchFromGitHub {
          owner = "kana";
          repo = "vim-textobj-indent";
          rev = "deb76867c302f933c8f21753806cbf2d8461b548";
          sha256 = "sha256-oFzUPG+IOkbKZ2gU/kduQ3G/LsLDlEjFhRP0BHBE+1Q=";
        };
      })
    ];
    globals = {
      sort_motion_flags = "i";
    };
  };
}
