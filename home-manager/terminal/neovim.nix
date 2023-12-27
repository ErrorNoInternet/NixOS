{
  config,
  inputs,
  pkgs,
  ...
}: {
  programs.nixvim = {
    enable = true;
    package = inputs.neovim.packages.${pkgs.system}.neovim;
    defaultEditor = true;

    colorschemes.nord = {
      enable = true;
      disable_background = true;
      italic = false;
    };
    plugins = {
      coq-nvim = {
        enable = true;
        autoStart = "shut-up";
      };
      crates-nvim = {
        enable = true;
        extraOptions.src.coq.enabled = true;
      };
      bufferline = {
        enable = true;
        highlights = {
          separator = {
            fg = "#${config.colorScheme.colors.base00}";
            bg = "#${config.colorScheme.colors.base01}";
          };
          indicatorSelected = {
            bg = "#${config.colorScheme.colors.base03}";
          };

          fill = {bg = "#${config.colorScheme.colors.base01}";};
          background = {bg = "#${config.colorScheme.colors.base01}";};

          closeButtonSelected = {bg = "#${config.colorScheme.colors.base03}";};
          closeButtonVisible = {bg = "#${config.colorScheme.colors.base01}";};
          closeButton = {bg = "#${config.colorScheme.colors.base01}";};

          modifiedSelected = {bg = "#${config.colorScheme.colors.base03}";};
          modified = {bg = "#${config.colorScheme.colors.base01}";};

          bufferSelected = {
            bg = "#${config.colorScheme.colors.base03}";
            italic = false;
          };
          bufferVisible = {bg = "#${config.colorScheme.colors.base01}";};

          duplicateSelected = {bg = "#${config.colorScheme.colors.base03}";};
          duplicate = {bg = "#${config.colorScheme.colors.base01}";};

          errorSelected = {bg = "#${config.colorScheme.colors.base03}";};
          error = {bg = "#${config.colorScheme.colors.base01}";};
          errorDiagnosticSelected = {bg = "#${config.colorScheme.colors.base03}";};
          errorDiagnostic = {bg = "#${config.colorScheme.colors.base01}";};

          warningSelected = {bg = "#${config.colorScheme.colors.base03}";};
          warning = {bg = "#${config.colorScheme.colors.base01}";};
          warningDiagnosticSelected = {bg = "#${config.colorScheme.colors.base03}";};
          warningDiagnostic = {bg = "#${config.colorScheme.colors.base01}";};

          hintSelected = {bg = "#${config.colorScheme.colors.base03}";};
          hint = {bg = "#${config.colorScheme.colors.base01}";};
          hintDiagnosticSelected = {bg = "#${config.colorScheme.colors.base03}";};
          hintDiagnostic = {bg = "#${config.colorScheme.colors.base01}";};
        };
      };
      fidget = {
        enable = true;
        extraOptions = {
          notification.window.winblend = 0;
          progress.lsp.progress_ringbuf_size = 1024;
        };
      };
      indent-blankline = {
        enable = true;
        extraOptions = {
          indent.char = "";
          scope = {
            show_start = false;
            show_end = false;
          };
        };
      };
      leap.enable = true;
      lualine.enable = true;
      markdown-preview.enable = true;
      nix-develop.enable = true;
      nvim-autopairs.enable = true;
      nvim-colorizer = {
        enable = true;
        fileTypes = ["*"];
        userDefaultOptions = {
          names = false;
          RRGGBBAA = true;
          rgb_fn = true;
          hsl_fn = true;
        };
      };
      nvim-tree.enable = true;
      presence-nvim = {
        enable = true;
        neovimImageText = "Neovim";
        readingText = "Running some code";
        fileExplorerText = "Browsing a folder";
      };
      lsp = {
        enable = true;
        servers = {
          bashls.enable = true;
          clangd.enable = true;
          gopls.enable = true;
          html.enable = true;
          nil_ls.enable = true;
          pyright.enable = true;
          rust-analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
            installLanguageServer = false;
          };
        };
        keymaps.lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          "K" = "hover";
        };
      };
      rust-tools = {
        enable = true;
        # TODO: replace with null once PR is merged
        serverPackage = pkgs.hello;
        server = {
          check.command = "clippy";
        };
      };
      telescope.enable = true;
      treesitter.enable = true;
      trouble.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      actions-preview-nvim
      nvim-lspconfig
      suda-vim
      vim-go
      vim-sort-motion
      vim-wordmotion
      vim-textobj-user
      (pkgs.vimUtils.buildVimPlugin {
        pname = "vim-textobj-indent";
        version = "2023-01-18";
        src = pkgs.fetchFromGitHub {
          owner = "kana";
          repo = "vim-textobj-indent";
          rev = "deb76867c302f933c8f21753806cbf2d8461b548";
          sha256 = "sha256-oFzUPG+IOkbKZ2gU/kduQ3G/LsLDlEjFhRP0BHBE+1Q=";
        };
      })
    ];
    extraConfigLuaPre = ''
      require("actions-preview").setup()
    '';
    options = {
      cursorline = true;
      encoding = "utf8";
      expandtab = true;
      guicursor = "";
      number = true;
      shiftwidth = 4;
      shortmess = "ltToOCFcI";
      showmode = false;
      smartindent = true;
      smoothscroll = true;
      swapfile = false;
      tabstop = 4;
    };
    globals = {
      suda_smart_edit = 1;

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
    extraConfigLuaPost = ''
      vim.g.coq_settings = {
        ["clients.snippets.warn"] = {},
        ["keymap.jump_to_mark"] = "<c-g>",
      }
    '';
    highlight = {
      CursorLine.bg = "none";
      MatchParen = {
        fg = "#${config.colorScheme.colors.base0D}";
        bg = "#${config.colorScheme.colors.base03}";
      };
      "@variable".bold = false;
      Function.bold = true;
      Macro = {
        fg = "#${config.colorScheme.colors.base0D}";
        bold = true;
      };
      RustEnumVariant.fg = "#${config.colorScheme.colors.base0C}";
      CocFloating.bg = "#${config.colorScheme.colors.base01}";
      CocSearch.fg = "#${config.colorScheme.colors.base0D}";
      CocInlayHint.fg = "#${config.colorScheme.colors.base07}";
      "@ibl.indent.char.1".fg = "#${config.colorScheme.colors.base00}";
    };
    keymaps = [
      {
        mode = "n";
        key = "<C-n>";
        action = "<esc>:bnext<CR>";
      }
      {
        mode = "n";
        key = "<C-p>";
        action = "<esc>:bprevious<CR>";
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
        action = "<esc>ldwi";
      }
      {
        mode = "n";
        options.remap = true;
        key = "<C-Del>";
        action = "dwi";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<F3>";
        action = ":nohl<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<C-S>";
        action = ":w<CR>";
      }
      {
        mode = "v";
        options.silent = true;
        key = "<C-S>";
        action = "<C-C>:w<CR>";
      }
      {
        mode = "i";
        options.silent = true;
        key = "<C-S>";
        action = "<C-O>:w<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<C-D>";
        action = ":bd<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<C-l>";
        action = ":NvimTreeToggle<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>l";
        action = ":NvimTreeFocus<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>a";
        action = ":lua require('actions-preview').code_actions()<CR>";
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
        key = "<leader>t";
        action = ":TroubleToggle<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>ff";
        action = ":Telescope find_files<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>fg";
        action = ":Telescope live_grep<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>fb";
        action = ":Telescope buffers<CR>";
      }
    ];
    autoCmd = [
      {
        event = ["TermOpen"];
        pattern = ["*"];
        command = "startinsert";
      }

      {
        event = ["FileType"];
        pattern = ["python"];
        command = "setlocal tabstop=4";
      }
      {
        event = ["FileType"];
        pattern = ["python"];
        command = "map <buffer> <F10> :wa<CR>:term python3 %<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["python"];
        command = "imap <buffer> <F10> <esc>:wa<CR>:term python3 %<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["python"];
        command = "map <buffer> <F8> :wa<CR>:term pypy3 %<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["python"];
        command = "imap <buffer> <F8> <esc>:wa<CR>:term pypy3 %<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["python"];
        command = "map <buffer> <F2> :w<CR>:call FormatPythonBuffer()<CR>:w<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["python"];
        command = "imap <buffer> <F2> <esc>:w<CR>:call FormatPythonBuffer()<CR>:w<CR>";
      }

      {
        event = ["FileType"];
        pattern = ["lua"];
        command = "map <buffer> <F10> :wa<CR>:term lua %<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["lua"];
        command = "imap <buffer> <F10> <esc>:wa<CR>:term lua %<CR>";
      }

      {
        event = ["FileType"];
        pattern = ["sh"];
        command = "map <buffer> <F10> :wa<CR>:term sh %<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["sh"];
        command = "imap <buffer> <F10> <esc>:wa<CR>:term sh %<CR>";
      }

      {
        event = ["FileType"];
        pattern = ["java"];
        command = "map <buffer> <F10> :wa<CR>:term jcompile<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["java"];
        command = "imap <buffer> <F10> <esc>:wa<CR>:term jcompile<CR>";
      }

      {
        event = ["FileType"];
        pattern = ["c"];
        command = "map <buffer> <F10> :wa<CR>:term clang -lm % -o %:t:r && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["c"];
        command = "imap <buffer> <F10> <esc> :wa<CR>:term clang -lm % -o %:t:r && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["c"];
        command = "map <buffer> <F2> :w<CR>:call FormatCBuffer()<CR>:w<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["c"];
        command = "imap <buffer> <F2> <esc>:w<CR>:call FormatCBuffer()<CR>:w<CR>";
      }

      {
        event = ["FileType"];
        pattern = ["cpp"];
        command = "setlocal shiftwidth=2 softtabstop=2 expandtab";
      }
      {
        event = ["FileType"];
        pattern = ["cpp"];
        command = "map <buffer> <F10> :wa<CR>:term clang -lm % -o %:t:r && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["cpp"];
        command = "imap <buffer> <F10> <esc> :wa<CR>:term clang -lm % -o %:t:r && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["cpp"];
        command = "map <buffer> <F2> :w<CR>:call FormatCBuffer()<CR>:w<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["cpp"];
        command = "imap <buffer> <F2> <esc>:w<CR>:call FormatCBuffer()<CR>:w<CR>";
      }

      {
        event = ["FileType"];
        pattern = ["cs"];
        command = "map <buffer> <F10> :wa<CR>:term mcs % -out:%:t:r && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["cs"];
        command = "imap <buffer> <F10> <esc> :wa<CR>:term mcs % -out:%:t:r && ./%:t:r<CR>";
      }

      {
        event = ["FileType"];
        pattern = ["javascript"];
        command = "map <buffer> <F10> :wa<CR>:term node %<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["javascript"];
        command = "imap <buffer> <F10> <esc> :wa<CR>:term node %<CR>";
      }

      {
        event = ["FileType"];
        pattern = ["go"];
        command = "map <buffer> <F10> :wa<CR>:term go run .<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["go"];
        command = "imap <buffer> <F10> <esc> :wa<CR>:term go run .<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["go"];
        command = "map <buffer> <F2> :w<CR>:GoFmt<CR>:w<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["go"];
        command = "imap <buffer> <F2> <esc>:w<CR>:GoFmt<CR>:w<CR>";
      }

      {
        event = ["FileType"];
        pattern = ["rust"];
        command = "map <buffer> <F10> :wa<CR>:term cd %:p:h:h && cargo run<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["rust"];
        command = "imap <buffer> <F10> <esc> :wa<CR>:term cd %:p:h:h && cargo run<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["rust"];
        command = "map <buffer> <F8> :wa<CR>:term cd %:p:h:h && cargo run --release<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["rust"];
        command = "imap <buffer> <F8> <esc> :wa<CR>:term cd %:p:h:h && cargo run --release<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["rust"];
        command = "map <buffer> <F9> :wa<CR>:term rustc % && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["rust"];
        command = "imap <buffer> <F9> <esc> :wa<CR>:term rustc % && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["rust"];
        command = "map <buffer> <F11> :wa<CR>:term cd %:p:h:h && cargo build<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["rust"];
        command = "imap <buffer> <F11> <esc> :wa<CR>:term cd %:p:h:h && cargo build<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["rust"];
        command = "map <buffer> <F2> :w<CR>:RustFmt<CR>:w<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["rust"];
        command = "imap <buffer> <F2> <esc>:w<CR>:RustFmt<CR>:w<CR>";
      }

      {
        event = ["FileType"];
        pattern = ["nix"];
        command = "setlocal shiftwidth=2 softtabstop=2 expandtab";
      }
      {
        event = ["FileType"];
        pattern = ["nix"];
        command = "map <buffer> <F2> :w<CR>:call FormatNixBuffer()<CR>:w<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["nix"];
        command = "imap <buffer> <F2> <esc>:w<CR>:call FormatNixBuffer()<CR>:w<CR>";
      }
    ];
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

      aunmenu PopUp.How-to\ disable\ mouse
      aunmenu PopUp.-1-

      echo ""
    '';
  };
}
