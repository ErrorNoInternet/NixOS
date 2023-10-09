{ pkgs }:

{
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
            nerdtree
            nord-nvim
            presence-nvim
            rust-vim
            suda-vim
            vim-airline
            vim-airline-themes
            vim-devicons
            vim-go

            coc-go
            coc-html
            coc-python
            coc-rust-analyzer
            coc-sh
        ];
        extraConfig = ''
"Basic Configuration
syntax on
set number
set mouse=a
set mousemoveevent
set cursorline
set guicursor=
set laststatus=2
set noshowmode
set completeopt-=preview

filetype plugin indent on
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent

set noswapfile
set encoding=utf-8
set fileencoding=utf-8

autocmd TermOpen * startinsert

let g:python3_host_prog="/usr/bin/python3"
let g:semshi#error_sign=v:false
let NERDTreeMinimalUI=1
let g:presence_file_explorer_text  = "Browsing a folder"
let g:presence_reading_text        = "Running some code"
let g:presence_buttons             = 0
let g:suda_smart_edit = 1

"Mappings
nnoremap <C-n> <esc>:bnext<CR>
nnoremap <C-p> <esc>:bprevious<CR>
noremap <silent> <C-S> <esc>:w<CR>
vnoremap <silent> <C-S> <C-C>:w<CR>
inoremap <silent> <C-S> <C-O>:w<CR>
inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<tab>"
nnoremap <F3> :set hlsearch!<CR>
nnoremap <leader>l :NERDTreeFocus<CR>
nnoremap <C-l> :NERDTreeToggle<CR>

"Neovide
set guifont=JetBrainsMonoNL\ Nerd\ Font:h9
let g:neovide_remember_window_size = v:true
let g:neovide_cursor_vfx_mode = "pixiedust"
let g:neovide_cursor_vfx_particle_density = 20
let g:neovide_floating_opacity = 0.9

"Python IDE
autocmd FileType python map <buffer> <F10> :wa<CR>:term python3 %<CR>
autocmd FileType python imap <buffer> <F10> <esc>:wa<CR>:term python3 %<CR>
autocmd FileType python map <buffer> <F8> :wa<CR>:term pypy3 %<CR>
autocmd FileType python imap <buffer> <F8> <esc>:wa<CR>:term pypy3 %<CR>
autocmd FileType python setlocal tabstop=4

"Lua IDE
autocmd FileType lua map <buffer> <F10> :wa<CR>:term lua %<CR>
autocmd FileType lua imap <buffer> <F10> <esc>:wa<CR>:term lua %<CR>

"SH IDE
autocmd FileType sh map <buffer> <F10> :wa<CR>:term sh %<CR>
autocmd FileType sh imap <buffer> <F10> <esc>:wa<CR>:term sh %<CR>

"Java IDE
autocmd FileType java map <buffer> <F10> :wa<CR>:term jcompile<CR>
autocmd FileType java imap <buffer> <F10> <esc>:wa<CR>:term jcompile<CR>

"C IDE
autocmd FileType c map <buffer> <F10> :wa<CR>:term gcc -lm % -o %:t:r && ./%:t:r<CR>
autocmd FileType c imap <buffer> <F10> <esc> :wa<CR>:term gcc -lm % -o %:t:r && ./%:t:r<CR>

"C++ IDE
autocmd FileType cpp map <buffer> <F10> :wa<CR>:term g++ -lm % -o %:t:r && ./%:t:r<CR>
autocmd FileType cpp imap <buffer> <F10> <esc> :wa<CR>:term g++ -lm % -o %:t:r && ./%:t:r<CR>

"C# IDE
autocmd FileType cs map <buffer> <F10> :wa<CR>:term mcs % -out:%:t:r && ./%:t:r<CR>
autocmd FileType cs imap <buffer> <F10> <esc> :wa<CR>:term mcs % -out:%:t:r && ./%:t:r<CR>

"JavaScript IDE
autocmd FileType javascript map <buffer> <F10> :wa<CR>:term node %<CR>
autocmd FileType javascript imap <buffer> <F10> <esc> :wa<CR>:term node %<CR>

"Go IDE
autocmd FileType go map <buffer> <F10> :wa<CR>:term go run .<CR>
autocmd FileType go imap <buffer> <F10> <esc> :wa<CR>:term go run .<CR>
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1

"Rust IDE
autocmd FileType rust map <buffer> <F10> :wa<CR>:term cd %:p:h:h && cargo run<CR>
autocmd FileType rust imap <buffer> <F10> <esc> :wa<CR>:term cd %:p:h:h && cargo run<CR>
autocmd FileType rust map <buffer> <F8> :wa<CR>:term cd %:p:h:h && cargo run --release<CR>
autocmd FileType rust imap <buffer> <F8> <esc> :wa<CR>:term cd %:p:h:h && cargo run --release<CR>
let g:rustfmt_autosave = 1

"Themes
lua vim.g.nord_italic = false
lua vim.g.nord_disable_background = true
colorscheme nord
set termguicolors
highlight clear CursorLine
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme = 'nord_minimal'
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
require("bufferline").setup {
    options = {
        tab_size = 18,
        truncate_names = true,
        separator_style = "slant",
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
        fill = {
            bg = "#262C38"
        },
        separator = {
            fg = '#262C38'
        },
        separator_selected = {
            fg = '#262C38'
        },
        separator_visible = {
            fg = '#262C38'
        },
        buffer_selected = {
            italic = false
        }
    }
}
EOF
'';
    };
}
