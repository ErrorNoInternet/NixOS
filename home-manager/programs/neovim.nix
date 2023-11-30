{
  config,
  custom,
  lib,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    coc = {
      enable = true;
      settings = {
        "inlayHint.enable" = false;
        "rust-analyzer.checkOnSave.enable" = false;
      };
    };
    plugins = with pkgs.vimPlugins; [
      auto-pairs
      bufferline-nvim
      gruvbox-nvim
      indent-blankline-nvim
      markdown-preview-nvim
      nerdtree
      nix-develop-nvim
      nord-nvim
      nvim-colorizer-lua
      presence-nvim
      rust-vim
      suda-vim
      vim-airline
      vim-airline-themes
      vim-devicons
      vim-fugitive
      vim-go

      coc-clangd
      coc-go
      coc-html
      coc-python
      coc-rust-analyzer
      coc-sh
    ];
    extraConfig = ''
      filetype plugin indent on
      set completeopt-=preview
      set cursorline
      set encoding=utf-8
      set expandtab
      set fileencoding=utf-8
      set guicursor=
      set laststatus=2
      set mouse=a
      set mousemoveevent
      set noshowmode
      set noswapfile
      set number
      set shiftwidth=4
      set smartindent
      set softtabstop=4
      set tabstop=4
      syntax on

      let g:presence_buttons = 0
      let g:presence_neovim_image_text = "Neovim"
      let g:presence_reading_text = "Running some code"
      let g:presence_file_explorer_text = "Browsing a folder"
      let g:suda_smart_edit = 1
      let NERDTreeMinimalUI=1

      nnoremap <C-n> <esc>:bnext<CR>
      nnoremap <C-p> <esc>:bprevious<CR>
      noremap <silent> <C-S> <esc>:w<CR>
      vnoremap <silent> <C-S> <C-C>:w<CR>
      inoremap <silent> <C-S> <C-O>:w<CR>
      inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<tab>"
      nnoremap <F3> :set hlsearch!<CR>
      nnoremap <leader>l :NERDTreeFocus<CR>
      nnoremap <C-l> :NERDTreeToggle<CR>

      set guifont=JetBrainsMonoNL\ Nerd\ Font:h9
      let g:neovide_remember_window_size = v:true
      let g:neovide_cursor_vfx_mode = "pixiedust"
      let g:neovide_cursor_vfx_particle_density = 20
      let g:neovide_floating_opacity = 0.9

      function FormatCBuffer()
        let cursor_pos = getpos('.')
        :%!${pkgs.clang-tools}/bin/clang-format
        call setpos('.', cursor_pos)
      endfunction
      function FormatPythonBuffer()
        let cursor_pos = getpos('.')
        :%!${pkgs.black}/bin/black - 2>/dev/null
        call setpos('.', cursor_pos)
      endfunction

      autocmd TermOpen * startinsert

      autocmd FileType python setlocal tabstop=4
      autocmd FileType python map <buffer> <F10> :wa<CR>:term python3 %<CR>
      autocmd FileType python imap <buffer> <F10> <esc>:wa<CR>:term python3 %<CR>
      autocmd FileType python map <buffer> <F8> :wa<CR>:term pypy3 %<CR>
      autocmd FileType python imap <buffer> <F8> <esc>:wa<CR>:term pypy3 %<CR>
      autocmd FileType python map <buffer> <F2> :w<CR>:call FormatPythonBuffer()<CR>:w<CR>
      autocmd FileType python imap <buffer> <F2> <esc>:w<CR>:call FormatPythonBuffer()<CR>:w<CR>

      autocmd FileType lua map <buffer> <F10> :wa<CR>:term lua %<CR>
      autocmd FileType lua imap <buffer> <F10> <esc>:wa<CR>:term lua %<CR>

      autocmd FileType sh map <buffer> <F10> :wa<CR>:term sh %<CR>
      autocmd FileType sh imap <buffer> <F10> <esc>:wa<CR>:term sh %<CR>

      autocmd FileType java map <buffer> <F10> :wa<CR>:term jcompile<CR>
      autocmd FileType java imap <buffer> <F10> <esc>:wa<CR>:term jcompile<CR>

      autocmd FileType c setlocal shiftwidth=2 softtabstop=2 expandtab
      autocmd FileType c map <buffer> <F10> :wa<CR>:term clang -lm % -o %:t:r && ./%:t:r<CR>
      autocmd FileType c imap <buffer> <F10> <esc> :wa<CR>:term clang -lm % -o %:t:r && ./%:t:r<CR>
      autocmd FileType c map <buffer> <F2> :w<CR>:call FormatCBuffer()<CR>:w<CR>
      autocmd FileType c imap <buffer> <F2> <esc>:w<CR>:call FormatCBuffer()<CR>:w<CR>

      autocmd FileType cpp setlocal shiftwidth=2 softtabstop=2 expandtab
      autocmd FileType cpp map <buffer> <F10> :wa<CR>:term clang -lm % -o %:t:r && ./%:t:r<CR>
      autocmd FileType cpp imap <buffer> <F10> <esc> :wa<CR>:term clang -lm % -o %:t:r && ./%:t:r<CR>
      autocmd FileType cpp map <buffer> <F2> :w<CR>:call FormatCBuffer()<CR>:w<CR>
      autocmd FileType cpp imap <buffer> <F2> <esc>:w<CR>:call FormatCBuffer()<CR>:w<CR>

      autocmd FileType cs map <buffer> <F10> :wa<CR>:term mcs % -out:%:t:r && ./%:t:r<CR>
      autocmd FileType cs imap <buffer> <F10> <esc> :wa<CR>:term mcs % -out:%:t:r && ./%:t:r<CR>

      autocmd FileType javascript map <buffer> <F10> :wa<CR>:term node %<CR>
      autocmd FileType javascript imap <buffer> <F10> <esc> :wa<CR>:term node %<CR>

      autocmd FileType go map <buffer> <F10> :wa<CR>:term go run .<CR>
      autocmd FileType go imap <buffer> <F10> <esc> :wa<CR>:term go run .<CR>
      autocmd FileType go map <buffer> <F2> :w<CR>:GoFmt<CR>:w<CR>
      autocmd FileType go imap <buffer> <F2> <esc>:w<CR>:GoFmt<CR>:w<CR>
      let g:go_fmt_autosave = 0
      let g:go_highlight_array_whitespace_error = 1
      let g:go_highlight_build_constraints = 1
      let g:go_highlight_chan_whitespace_error = 1
      let g:go_highlight_diagnostic_errors = 1
      let g:go_highlight_diagnostic_warnings = 1
      let g:go_highlight_extra_types = 1
      let g:go_highlight_fields = 1
      let g:go_highlight_format_strings = 1
      let g:go_highlight_function_calls = 1
      let g:go_highlight_function_parameters = 1
      let g:go_highlight_functions = 1
      let g:go_highlight_generate_tags = 1
      let g:go_highlight_operators = 1
      let g:go_highlight_space_tab_error = 1
      let g:go_highlight_string_spellcheck = 1
      let g:go_highlight_trailing_whitespace_error = 1
      let g:go_highlight_types = 1
      let g:go_highlight_variable_assignments = 1
      let g:go_highlight_variable_declarations = 1

      autocmd FileType rust map <buffer> <F10> :wa<CR>:term cd %:p:h:h && cargo run<CR>
      autocmd FileType rust imap <buffer> <F10> <esc> :wa<CR>:term cd %:p:h:h && cargo run<CR>
      autocmd FileType rust map <buffer> <F8> :wa<CR>:term cd %:p:h:h && cargo run --release<CR>
      autocmd FileType rust imap <buffer> <F8> <esc> :wa<CR>:term cd %:p:h:h && cargo run --release<CR>
      autocmd FileType rust map <buffer> <F9> :wa<CR>:term rustc % && ./%:t:r<CR>
      autocmd FileType rust imap <buffer> <F9> <esc> :wa<CR>:term rustc % && ./%:t:r<CR>
      autocmd FileType rust map <buffer> <F11> :wa<CR>:term cd %:p:h:h && cargo build<CR>
      autocmd FileType rust imap <buffer> <F11> <esc> :wa<CR>:term cd %:p:h:h && cargo build<CR>
      autocmd FileType rust map <buffer> <F2> :w<CR>:RustFmt<CR>:w<CR>
      autocmd FileType rust imap <buffer> <F2> <esc>:w<CR>:RustFmt<CR>:w<CR>

      autocmd FileType nix setlocal shiftwidth=2 softtabstop=2 expandtab

      lua vim.g.nord_italic = false
      lua vim.g.nord_disable_background = true
      lua vim.o.termguicolors = true
      colorscheme ${lib.strings.toLower custom.predefinedColorScheme}
      highlight clear CursorLine
      highlight CocFloating guibg=#${config.colorScheme.colors.base01}
      let g:airline_theme = 'nord_minimal'

      if !exists('g:airline_symbols')
        let g:airline_symbols = {}
      endif
      let g:airline#extensions#branch#enabled = 1
      let g:airline_powerline_fonts = 1
      let g:airline_skip_empty_sections = 1
      let g:airline_symbols.maxlinenr = '''
      let g:airline_symbols.colnr = ' C:'
      let g:airline_symbols.linenr = " L:"
      let g:airline_left_sep = ''
      let g:airline_left_alt_sep = ''
      let g:airline_right_sep = ''
      let g:airline_right_alt_sep = ''
      let g:airline_theme_patch_func = 'AirlineThemePatch'
      let s:saved_theme = []
      function! AirlineThemePatch(palette)
        for colors in values(a:palette)
          if has_key(colors, 'airline_c') && len(s:saved_theme) ==# 0
            let s:saved_theme = colors.airline_c
          endif
          if has_key(colors, 'airline_term')
            let colors.airline_term = s:saved_theme
          endif
        endfor
      endfunction

      lua << EOF
      require("colorizer").setup {
        filetypes = {'*'},
        user_default_options = {
          names    = false;
          RRGGBBAA = true;
          rgb_fn   = true;
          hsl_fn   = true;
        }
      }

      require("ibl").setup {
        indent = { char = '' },
        scope = {
          show_start = false;
          show_end = false;
        },
      }

      require("bufferline").setup {
        options = {
          tab_size = 18,
          truncate_names = true,
          separator_style = "thin",
          show_close_icon = false,
          show_tab_indicators = false,
          diagnostics = "coc",
          diagnostics_update_in_insert = true,
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. ")"
          end,
          hover = {
            enabled = true,
            delay = 0,
            reveal = {'close'}
          }
        },
        highlights = {
          separator = {
            fg = '#${config.colorScheme.colors.base00}',
            bg = '#${config.colorScheme.colors.base01}'
          },
          fill = { bg = '#${config.colorScheme.colors.base01}' },
          background = { bg = '#${config.colorScheme.colors.base01}', },
          indicator_selected = { bg = '#${config.colorScheme.colors.base03}' },
          close_button_selected = { bg = '#${config.colorScheme.colors.base03}' },
          modified_selected = { bg = '#${config.colorScheme.colors.base03}' },
          close_button = { bg = '#${config.colorScheme.colors.base01}' },
          modified = { bg = '#${config.colorScheme.colors.base01}' },
          buffer_selected = { bg = '#${config.colorScheme.colors.base03}', italic = false },
          buffer = { bg = '#${config.colorScheme.colors.base01}' },
          duplicate_selected = { bg = '#${config.colorScheme.colors.base03}' },
          duplicate = { bg = '#${config.colorScheme.colors.base01}' },

          error_selected = { bg = '#${config.colorScheme.colors.base03}' },
          error = { bg = '#${config.colorScheme.colors.base01}' },
          error_diagnostic_selected = { bg = '#${config.colorScheme.colors.base03}' },
          error_diagnostic = { bg = '#${config.colorScheme.colors.base01}' },

          warning_selected = { bg = '#${config.colorScheme.colors.base03}' },
          warning = { bg = '#${config.colorScheme.colors.base01}' },
          warning_diagnostic_selected = { bg = '#${config.colorScheme.colors.base03}' },
          warning_diagnostic = { bg = '#${config.colorScheme.colors.base01}' },

          hint_selected = { bg = '#${config.colorScheme.colors.base03}' },
          hint = { bg = '#${config.colorScheme.colors.base01}' },
          hint_diagnostic_selected = { bg = '#${config.colorScheme.colors.base03}' },
          hint_diagnostic = { bg = '#${config.colorScheme.colors.base01}' },
        }
      }
      EOF
    '';
  };
}
