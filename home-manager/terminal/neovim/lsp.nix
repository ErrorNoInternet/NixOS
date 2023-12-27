{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      coq-nvim = {
        enable = true;
        autoStart = "shut-up";
      };

      treesitter.enable = true;

      treesitter-context = {
        enable = true;
        maxLines = 1;
      };

      trouble.enable = true;

      crates-nvim = {
        enable = true;
        extraOptions.src.coq.enabled = true;
      };

      rust-tools = {
        enable = true;
        # TODO: replace with null once PR is merged
        serverPackage = pkgs.hello;
        server = {
          check.command = "clippy";
        };
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
          rust-analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
            installLanguageServer = false;
          };
        };
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      actions-preview-nvim
      nvim-lspconfig
      vim-go
    ];
    extraConfigLuaPre = ''
      require("actions-preview").setup()
    '';
    extraConfigLuaPost = ''
      vim.g.coq_settings = {
        ["clients.snippets.warn"] = {},
        ["keymap.recommended"] = false,
        ["keymap.jump_to_mark"] = "<c-g>",
      }
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
    extraConfigVim = ''
      function FormatCBuffer()
        let cursor_pos = getpos('.')
        :%!${pkgs.clang-tools}/bin/clang-format -style="{BasedOnStyle: llvm, IndentWidth: 4}"
        call setpos('.', cursor_pos)
      endfunction

      function FormatPythonBuffer()
        let cursor_pos = getpos('.')
        :%!${pkgs.black}/bin/black - 2>/dev/null
        call setpos('.', cursor_pos)
      endfunction

      function FormatNixBuffer()
        let cursor_pos = getpos('.')
        :%!${pkgs.alejandra}/bin/alejandra - 2>/dev/null
        call setpos('.', cursor_pos)
      endfunction
    '';
  };
}
