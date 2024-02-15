{
  pkgs,
  self',
  ...
}: {
  programs.nixvim = {
    plugins = {
      leap.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-wordmotion

      self'.packages.vim-plugin-textobj-indent
      vim-sort-motion
      vim-textobj-user
    ];
    globals = {
      sort_motion_flags = "i";
    };
  };
}
