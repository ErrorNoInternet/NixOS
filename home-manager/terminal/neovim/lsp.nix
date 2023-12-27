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
    extraConfigLuaPost = ''
      vim.g.coq_settings = {
        ["clients.snippets.warn"] = {},
        ["keymap.recommended"] = false,
        ["keymap.jump_to_mark"] = "<c-g>",
      }
    '';
  };
}
