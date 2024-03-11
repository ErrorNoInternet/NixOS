{
  programs.nixvim = {
    plugins.cmp = let
      mkPreset = type: ''
        cmp.mapping.preset.${type}({
          ['<C-down>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-up>'] = cmp.mapping.scroll_docs(-4),
          ['<CR>'] = cmp.mapping.confirm(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<Tab>'] = cmp.mapping.select_next_item(),
        })
      '';
    in {
      cmdline = builtins.listToAttrs (map (name: {
        inherit name;
        value.mapping.__raw = mkPreset "cmdline";
      }) ["/" "?" ":"]);
      settings.mapping.__raw = mkPreset "insert";
    };

    extraConfigLuaPost = ''
      vim.keymap.set('n', 'K', function()
        local winid = require('ufo').peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end)
    '';

    keymaps = [
      {
        mode = "c";
        key = "<Tab>";
        action = "<C-z>";
      }

      {
        mode = "";
        key = "<C-f>";
        action = "<cmd>lua require('luasnip').jump(1)<CR>";
      }
      {
        mode = "i";
        key = "<C-f>";
        action = "<cmd>lua require('luasnip').jump(1)<CR>";
      }
      {
        mode = "";
        key = "<C-M-f>";
        action = "<cmd>lua require('luasnip').jump(-1)<CR>";
      }
      {
        mode = "i";
        key = "<C-M-f>";
        action = "<cmd>lua require('luasnip').jump(-1)<CR>";
      }
      {
        mode = "i";
        key = "<C-t>";
        action = "<Plug>luasnip-next-choice";
      }

      {
        mode = "n";
        options.silent = true;
        key = "<leader>o";
        action = ":Lspsaga outline<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>pd";
        action = ":Lspsaga peek_definition<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>pD";
        action = ":Lspsaga finder<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>r";
        action = ":Lspsaga rename<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>a";
        action = ":Lspsaga code_action<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>ca";
        action = ":lua require('crates').show_popup()<CR>";
      }

      {
        mode = "n";
        options.silent = true;
        key = "<leader>xn";
        action = ":Trouble<CR>:lua require('trouble').next({skip_groups = true, jump = true})<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>xp";
        action = ":Trouble<CR>:lua require('trouble').previous({skip_groups = true, jump = true})<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>xx";
        action = ":Trouble document_diagnostics<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>xw";
        action = ":Trouble workspace_diagnostics<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>xd";
        action = ":Trouble lsp_definitions<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>xD";
        action = ":Trouble lsp_references<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>xi";
        action = ":Trouble lsp_implementations<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>xT";
        action = ":Trouble lsp_type_definitions<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>xq";
        action = ":Trouble quickfix<CR>";
      }

      {
        mode = "n";
        options.silent = true;
        key = "<leader>fs";
        action = ":Telescope lsp_workspace_symbols<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>fS";
        action = ":Telescope git_status<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>tc";
        action = ":TSContextToggle<CR>";
      }

      {
        mode = "n";
        options.silent = true;
        key = "<F2>";
        action = ":lua vim.lsp.buf.format()<CR>:w<CR>";
      }
      {
        mode = "i";
        options.silent = true;
        key = "<F2>";
        action = "<esc>:lua vim.lsp.buf.format()<CR>:w<CR>";
      }
    ];
  };
}
