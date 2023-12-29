{
  programs.nixvim = {
    plugins.lsp.keymaps.lspBuf = {
      "K" = "hover";
    };
    keymaps = [
      {
        mode = "n";
        key = ",";
        action = ":wqa!";
      }
      {
        mode = "n";
        key = ".";
        action = ":qa!";
      }

      {
        mode = "";
        key = "<S-down>";
        action = "10j";
      }
      {
        mode = "";
        key = "<S-up>";
        action = "10k";
      }

      {
        mode = "";
        options.silent = true;
        key = "<C-n>";
        action = "<cmd>:bnext<CR>";
      }
      {
        mode = "";
        options.silent = true;
        key = "<C-p>";
        action = "<cmd>:bprevious<CR>";
      }
      {
        mode = "i";
        options.silent = true;
        key = "<C-n>";
        action = "<esc>:bnext<CR>";
      }
      {
        mode = "i";
        options.silent = true;
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
        mode = "i";
        options.silent = true;
        key = "<F3>";
        action = "<esc>:w<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<F3>";
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
        key = ";bd";
        action = ":bd<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<C-D>";
        action = ":Bdelete<CR>";
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
        key = "<leader>u";
        action = ":UndotreeToggle<CR>";
      }

      {
        mode = "n";
        options.silent = true;
        key = "<C-m>";
        action = ":MinimapToggle<CR>";
      }

      {
        mode = "";
        key = "<S-Tab>";
        action = "<cmd>lua require('luasnip').jump(1)<Cr>";
      }
      {
        mode = "i";
        key = "<S-Tab>";
        action = "<cmd>lua require('luasnip').jump(1)<Cr>";
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
      {
        mode = "n";
        options.silent = true;
        key = "<leader>fs";
        action = ":Telescope lsp_workspace_symbols<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>fc";
        action = ":Telescope git_bcommits<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>fC";
        action = ":Telescope git_commits<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>fS";
        action = ":Telescope git_status<CR>";
      }
    ];

    autoCmd = [
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
        command = "map <buffer> <F2> :w<CR>:call FormatNixBuffer()<CR>:w<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["nix"];
        command = "imap <buffer> <F2> <esc>:w<CR>:call FormatNixBuffer()<CR>:w<CR>";
      }
    ];
  };
}
