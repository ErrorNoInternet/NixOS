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
        action = "<cmd>m .+1<CR>==";
      }
      {
        mode = "n";
        key = "<c-k>";
        action = "<cmd>m .-2<CR>==";
      }
      {
        mode = "i";
        key = "<c-j>";
        action = "<esc><cmd>m .+1<CR>==gi";
      }
      {
        mode = "i";
        key = "<c-k>";
        action = "<esc><cmd>m .-2<CR>==gi";
      }
      {
        mode = "v";
        key = "<c-j>";
        action = "<cmd>m '>+1<CR>gv=gv";
      }
      {
        mode = "v";
        key = "<c-k>";
        action = "<cmd>m '<-2<CR>gv=gv";
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
        action = "<esc><cmd>w<CR>";
      }
      {
        mode = "n";
        options = {
          remap = true;
          silent = true;
        };
        key = "<F1>";
        action = "<cmd>w<CR>";
      }
      {
        mode = "i";
        options.silent = true;
        key = "<C-S>";
        action = "<esc><cmd>w<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<C-S>";
        action = "<cmd>w<CR>";
      }

      {
        mode = "n";
        options.silent = true;
        key = "gt";
        action = "<cmd>BufferNext<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "gT";
        action = "<cmd>BufferPrevious<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = ";d";
        action = "<cmd>bd<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = ";D";
        action = "<cmd>bd!<CR>";
      }

      {
        mode = "n";
        options.silent = true;
        key = "<C-l>";
        action = "<cmd>Neotree toggle<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>l";
        action = "<cmd>Neotree focus<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>v";
        action = "<cmd>Neotree reveal<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>u";
        action = "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>";
      }
      {
        mode = "i";
        options.silent = true;
        key = "<F4>";
        action = "<esc><cmd>nohl<CR><cmd>MinimapRefresh<CR>i";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<F4>";
        action = "<cmd>nohl<CR><cmd>MinimapRefresh<CR>";
      }

      {
        mode = "n";
        options.silent = true;
        key = "<leader>fy";
        action = "<cmd>Telescope yank_history<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>fe";
        action = "<cmd>Telescope spell_suggest<CR>";
      }
    ]
    ++ (builtins.genList (n: {
        mode = "n";
        options.silent = true;
        key = "<leader>${builtins.toString (n + 1)}";
        action = "<cmd>BufferGoto ${builtins.toString (n + 1)}<CR>";
      })
      9);
}
