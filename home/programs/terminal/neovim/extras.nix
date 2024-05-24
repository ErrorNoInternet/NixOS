{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      presence-nvim = {
        enable = true;
        neovimImageText = "Neovim";
        readingText = "Running some code";
        fileExplorerText = "Browsing a folder";
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-suda
    ];
    globals = {
      suda_smart_edit = 1;
    };
  };
}
