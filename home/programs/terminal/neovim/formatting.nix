{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      alejandra
      black
      clang-tools
      isort
      taplo
    ];

    plugins.conform-nvim = {
      enable = true;

      formattersByFt = {
        c = ["clang_format"];
        cpp = ["clang_format"];
        go = ["gofmt"];
        nix = ["alejandra"];
        python = ["isort" "black"];
        rust = ["rustfmt"];
        toml = ["taplo"];
      };
    };

    autoCmd = let
      languages = [
        "c"
        "cpp"
        "go"
        "nix"
        "python"
        "rust"
        "toml"
      ];
      command = ":lua require('conform').format()";
    in
      builtins.concatLists (map (language: [
          {
            event = ["FileType"];
            pattern = [language];
            command = "map <buffer> <F3> ${command}<CR>:w<CR>";
          }
          {
            event = ["FileType"];
            pattern = [language];
            command = "imap <buffer> <F3> ${command}<CR>:w<CR>";
          }
          {
            event = ["FileType"];
            pattern = [language];
            command = "map <buffer> <F4> ${command}<CR>";
          }
          {
            event = ["FileType"];
            pattern = [language];
            command = "imap <buffer> <F4> ${command}<CR>";
          }
        ])
        languages);

    keymaps = [
      {
        mode = "n";
        options.silent = true;
        key = "<F3>";
        action = ":lua vim.lsp.buf.format()<CR>:w<CR>";
      }
      {
        mode = "i";
        options.silent = true;
        key = "<F3>";
        action = "<esc>:lua vim.lsp.buf.format()<CR>:w<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<F4>";
        action = ":lua vim.lsp.buf.format()<CR>";
      }
      {
        mode = "i";
        options.silent = true;
        key = "<F4>";
        action = "<esc>:lua vim.lsp.buf.format()<CR>";
      }
    ];
  };
}
