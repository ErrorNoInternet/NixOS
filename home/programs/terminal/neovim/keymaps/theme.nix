{
  programs.nixvim = {
    plugins = {
      barbar.keymaps = {
        silent = true;
        close = "<C-d>";
        next = "<C-n>";
        previous = "<C-p>";
        moveNext = "<M-n>";
        movePrevious = "<M-p>";
        pick = "<leader>b";
      };
    };

    keymaps = [
      {
        mode = "n";
        options.silent = true;
        key = "<leader>m";
        action = ":MinimapToggle<CR>";
      }
    ];
  };
}
