{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "+";
        action = "A;";
      }

      {
        mode = "n";
        options.silent = true;
        key = "<leader>ds";
        action = ":lua require('dapui').setup()<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>dc";
        action = ":lua require('dapui').toggle()<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>dk";
        action = ":lua require('dapui').eval()<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>df";
        action = ":lua require('dapui').float_element()<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>db";
        action = ":DapToggleBreakpoint<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>dt";
        action = ":DapTerminate<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>dd";
        action = ":DapContinue<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>di";
        action = ":DapStepInto<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>dO";
        action = ":DapStepOut<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>do";
        action = ":DapStepOver<CR>";
      }

      {
        mode = "n";
        options.silent = true;
        key = "<leader>ft";
        action = ":TodoTelescope<CR>";
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
        key = "<leader>fz";
        action = ":Telescope current_buffer_fuzzy_find<CR>";
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
        key = "<leader>fc";
        action = ":Telescope git_bcommits<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<leader>fC";
        action = ":Telescope git_commits<CR>";
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
        command = "map <buffer> <F2> :w<CR>:Neoformat python black<CR>:w<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["python"];
        command = "imap <buffer> <F2> <esc>:w<CR>:Neoformat python black<CR>:w<CR>";
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
        command = "map <buffer> <F10> :wa<CR>:term clang -g -lm % -o %:t:r && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["c"];
        command = "imap <buffer> <F10> <esc> :wa<CR>:term clang -g -lm % -o %:t:r && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["c"];
        command = "map <buffer> <F8> :wa<CR>:term clang -O3 -lm % -o %:t:r && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["c"];
        command = "imap <buffer> <F8> <esc> :wa<CR>:term clang -O3 -lm % -o %:t:r && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["c"];
        command = "map <buffer> <F11> :wa<CR>:term clang -g -lm % -o %:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["c"];
        command = "imap <buffer> <F11> <esc> :wa<CR>:term clang -g -lm % -o %:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["c"];
        command = "map <buffer> <F2> :w<CR>:Neoformat clangformat<CR>:w<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["c"];
        command = "imap <buffer> <F2> <esc>:w<CR>:Neoformat clangformat<CR>:w<CR>";
      }

      {
        event = ["FileType"];
        pattern = ["cpp"];
        command = "map <buffer> <F10> :wa<CR>:term clang++ -g % -o %:t:r && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["cpp"];
        command = "imap <buffer> <F10> <esc> :wa<CR>:term clang++ -g % -o %:t:r && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["cpp"];
        command = "map <buffer> <F8> :wa<CR>:term clang++ -O3 % -o %:t:r && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["cpp"];
        command = "imap <buffer> <F8> <esc> :wa<CR>:term clang++ -O3 % -o %:t:r && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["cpp"];
        command = "map <buffer> <F11> :wa<CR>:term clang++ -g % -o %:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["cpp"];
        command = "imap <buffer> <F11> <esc> :wa<CR>:term clang++ -g % -o %:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["cpp"];
        command = "map <buffer> <F2> :w<CR>:Neoformat clangformat<CR>:w<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["cpp"];
        command = "imap <buffer> <F2> <esc>:w<CR>:Neoformat clangformat<CR>:w<CR>";
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
        command = "map <buffer> <F9> :wa<CR>:term rustc -g % && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["rust"];
        command = "imap <buffer> <F9> <esc> :wa<CR>:term rustc -g % && ./%:t:r<CR>";
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
        pattern = ["zig"];
        command = "map <buffer> <F10> :wa<CR>:term cd %:p:h:h && zig build run<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["zig"];
        command = "imap <buffer> <F10> <esc> :wa<CR>:term cd %:p:h:h && zig build run<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["zig"];
        command = "map <buffer> <F8> :wa<CR>:term cd %:p:h:h && zig build run -Doptimize=ReleaseFast<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["zig"];
        command = "imap <buffer> <F8> <esc> :wa<CR>:term cd %:p:h:h && zig build run -Doptimize=ReleaseFast<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["zig"];
        command = "map <buffer> <F9> :wa<CR>:term zig build-exe % && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["zig"];
        command = "imap <buffer> <F9> <esc> :wa<CR>:term zig build-exe % && ./%:t:r<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["zig"];
        command = "map <buffer> <F11> :wa<CR>:term cd %:p:h:h && zig build<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["zig"];
        command = "imap <buffer> <F11> <esc> :wa<CR>:term cd %:p:h:h && zig build<CR>";
      }

      {
        event = ["FileType"];
        pattern = ["toml"];
        command = "map <buffer> <F2> :w<CR>:Neoformat taplo<CR>:w<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["toml"];
        command = "imap <buffer> <F2> <esc>:w<CR>:Neoformat taplo<CR>:w<CR>";
      }

      {
        event = ["FileType"];
        pattern = ["nix"];
        command = "map <buffer> <F2> :w<CR>:Neoformat alejandra<CR>:w<CR>";
      }
      {
        event = ["FileType"];
        pattern = ["nix"];
        command = "imap <buffer> <F2> <esc>:w<CR>:Neoformat alejandra<CR>:w<CR>";
      }
    ];
  };
}
