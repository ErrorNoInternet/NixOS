{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      leap.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-wordmotion

      vim-sort-motion
      vim-textobj-user
      pkgs.vimPlugin-textobj-indent
    ];
    globals = {
      sort_motion_flags = "i";
    };
  };
}
