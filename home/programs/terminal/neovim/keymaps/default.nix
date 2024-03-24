{
  imports = [
    ./development.nix
    ./lsp.nix
    ./theme.nix
  ];

  programs.nixvim.keymaps =
    [
      {
        mode = "n";
        key = ",";
        action = ":wqa!";
      }
      {
        mode = "n";
        key = "-";
        action = ":qa!";
      }

      {
        mode = "";
        key = "<S-down>";
        action = "5j";
      }
      {
        mode = "";
        key = "<S-up>";
        action = "5k";
      }
      {
        mode = "";
        key = "j";
        action = "gj";
      }
      {
        mode = "";
        key = "k";
        action = "gk";
      }

      {
        mode = "n";
        key = "<c-j>";
        action = ":m .+1<CR>==";
      }
      {
        mode = "n";
        key = "<c-k>";
        action = ":m .-2<CR>==";
      }
      {
        mode = "i";
        key = "<c-j>";
        action = "<esc>:m .+1<CR>==gi";
      }
      {
        mode = "i";
        key = "<c-k>";
        action = "<esc>:m .-2<CR>==gi";
      }
      {
        mode = "v";
        key = "<c-j>";
        action = ":m '>+1<CR>gv=gv";
      }
      {
        mode = "v";
        key = "<c-k>";
        action = ":m '<-2<CR>gv=gv";
      }

      {
        mode = "n";
        key = "gs";
        action = "<Plug>SortMotion";
      }
      {
        mode = "x";
        key = "gs";
        action = "<Plug>SortMotionVisual";
      }
      {
        mode = "n";
        key = "gss";
        action = "<Plug>SortLines";
      }
      {
        mode = "i";
        options.remap = true;
        key = "<C-h>";
        action = "<esc>dbi<del>";
      }
      {
        mode = "n";
        options.remap = true;
        key = "<C-h>";
        action = "dbi<del>";
      }
      {
        mode = "i";
        options.remap = true;
        key = "<C-Del>";
        action = "<esc><right>wdbi";
      }
      {
        mode = "n";
        options.remap = true;
        key = "<C-Del>";
        action = "wdbi";
      }

      {
        mode = "i";
        options = {
          remap = true;
          silent = true;
        };
        key = "<F1>";
        action = "<esc>:w<CR>";
      }
      {
        mode = "n";
        options = {
          remap = true;
          silent = true;
        };
        key = "<F1>";
        action = ":w<CR>";
      }
      {
        mode = "i";
        options.silent = true;
        key = "<C-S>";
        action = "<esc>:w<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<C-S>";
        action = ":w<CR>";
      }

      {
        mode = "n";
        options.silent = true;
        key = "gt";
        action = ":BufferNext<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "gT";
        action = ":BufferPrevious<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = ";d";
        action = ":bd<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = ";D";
        action = ":bd!<CR>";
      }

      {
        mode = "n";
        options.silent = true;
        key = "<C-l>";
        action = ":Neotree toggle<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>l";
        action = ":Neotree focus<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>u";
        action = ":UndotreeToggle<CR>:UndotreeFocus<CR>";
      }
      {
        mode = "i";
        options.silent = true;
        key = "<F4>";
        action = "<esc>:nohl<CR>:MinimapRefresh<CR>i";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<F4>";
        action = ":nohl<CR>:MinimapRefresh<CR>";
      }

      {
        mode = "n";
        options.silent = true;
        key = "<leader>fy";
        action = ":Telescope yank_history<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>fe";
        action = ":Telescope spell_suggest<CR>";
      }
    ]
    ++ (builtins.genList (n: {
        mode = "n";
        options.silent = true;
        key = "<leader>${builtins.toString (n + 1)}";
        action = ":BufferGoto ${builtins.toString (n + 1)}<CR>";
      })
      9);
}
