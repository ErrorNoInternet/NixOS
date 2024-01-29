{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        nixvimInjections = true;

        incrementalSelection.enable = true;
      };

      treesitter-context = {
        enable = true;
        minWindowHeight = 12;
        maxLines = 3;
      };

      trouble.enable = true;

      nvim-cmp = {
        enable = true;
        sources = [
          {name = "buffer";}
          {name = "crates";}
          {name = "luasnip";}
          {name = "nvim_lsp";}
          {name = "path";}
        ];
        snippet.expand = "luasnip";
      };
      cmp_luasnip.enable = true;
      luasnip.enable = true;

      crates-nvim = {
        enable = true;
        extraOptions.src.cmp.enabled = true;
      };

      zig = {
        enable = true;
        formatOnSave = false;
      };

      lsp = {
        enable = true;
        servers = {
          bashls.enable = true;
          clangd.enable = true;
          cssls.enable = true;
          gopls.enable = true;
          html.enable = true;
          jsonls.enable = true;
          lua-ls.enable = true;
          nil_ls.enable = true;
          pyright.enable = true;
          yamlls.enable = true;
          zls.enable = true;
          rust-analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
            installLanguageServer = false;

            settings.checkOnSave = false;
          };
        };
      };

      lsp-format.enable = true;

      lspsaga = {
        enable = true;
        lightbulb.enable = false;
        symbolInWinbar.enable = false;
        beacon.enable = false;
        ui.codeAction = "";
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-go

      friendly-snippets
      nvim-lspconfig
    ];
    extraConfigLuaPre = ''
      vim.highlight.priorities.semantic_tokens = 99
    '';
    extraConfigLuaPost = ''
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      cmp.setup.cmdline(':', {
        sources = {
          { name = 'path' }
        }
      })
      vim.keymap.set('c', '<tab>', '<C-z>', { silent = false })
    '';
    globals = {
      go_fmt_autosave = 0;
      go_highlight_array_whitespace_error = 1;
      go_highlight_build_constraints = 1;
      go_highlight_chan_whitespace_error = 1;
      go_highlight_diagnostic_errors = 1;
      go_highlight_diagnostic_warnings = 1;
      go_highlight_extra_types = 1;
      go_highlight_fields = 1;
      go_highlight_format_strings = 1;
      go_highlight_function_calls = 1;
      go_highlight_function_parameters = 1;
      go_highlight_functions = 1;
      go_highlight_generate_tags = 1;
      go_highlight_operators = 1;
      go_highlight_space_tab_error = 1;
      go_highlight_string_spellcheck = 1;
      go_highlight_trailing_whitespace_error = 1;
      go_highlight_types = 1;
      go_highlight_variable_assignments = 1;
      go_highlight_variable_declarations = 1;
    };
  };
}
