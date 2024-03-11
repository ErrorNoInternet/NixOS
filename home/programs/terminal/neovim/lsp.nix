{pkgs, ...}: {
  programs.nixvim = {
    filetype.pattern.".*/hyprland%.conf" = "hyprlang";

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

      cmp = {
        enable = true;

        settings = {
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          sources = map (name: {inherit name;}) [
            "buffer"
            "calc"
            "crates"
            "luasnip"
            "nvim_lsp"
            "path"
            "treesitter"
          ];
        };
        cmdline =
          (builtins.listToAttrs (map (name: {
              inherit name;
              value.sources = [{name = "buffer";}];
            })
            ["/" "?"]))
          // {":".sources = [{name = "path";}];};
      };
      cmp-calc.enable = true;
      cmp-treesitter.enable = true;
      cmp_luasnip.enable = true;
      luasnip = {
        enable = true;
        fromVscode = [{}];
      };

      crates-nvim = {
        enable = true;
        extraOptions.src.cmp.enabled = true;
      };

      zig = {
        enable = true;
        settings.fmt_autosave = false;
      };

      lsp = {
        enable = true;
        postConfig = ''
          vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
              update_in_insert = true,
            }
          )
        '';

        servers = {
          bashls.enable = true;
          clangd = {
            enable = true;
            package = null;
          };
          cssls.enable = true;
          gopls.enable = true;
          html.enable = true;
          jsonls.enable = true;
          lua-ls.enable = true;
          nil_ls.enable = true;
          pyright.enable = true;
          rust-analyzer = {
            enable = true;
            package = null;
            installCargo = false;
            installRustc = false;

            settings.checkOnSave = false;
          };
          taplo.enable = true;
          yamlls.enable = true;
          zls.enable = true;
        };
      };

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
