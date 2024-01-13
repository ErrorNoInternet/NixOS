{
  programs.nixvim.plugins = {
    barbar.keymaps = {
      silent = true;
      next = "<C-n>";
      previous = "<C-p>";
      moveNext = "<M-n>";
      movePrevious = "<M-p>";
      pick = "<leader>b";
    };

    vim-bbye.keymaps.bdelete = "<C-D>";
  };
}
