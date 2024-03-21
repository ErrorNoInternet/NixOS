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
            command = "map <buffer><silent> <F2> ${command}<CR>:w<CR>";
          }
          {
            event = ["FileType"];
            pattern = [language];
            command = "imap <buffer><silent> <F2> <esc>${command}<CR>:w<CR>";
          }
          {
            event = ["FileType"];
            pattern = [language];
            command = "map <buffer><silent> <F3> ${command}<CR>";
          }
          {
            event = ["FileType"];
            pattern = [language];
            command = "imap <buffer><silent> <F3> <esc>${command}<CR>";
          }
        ])
        languages);

    keymaps = [
      {
        mode = "n";
        options.silent = true;
        key = "<F2>";
        action = ":lua vim.lsp.buf.format()<CR>:w<CR>";
      }
      {
        mode = "i";
        options.silent = true;
        key = "<F2>";
        action = "<esc>:lua vim.lsp.buf.format()<CR>:w<CR>";
      }
      {
        mode = "n";
        options.silent = true;
        key = "<F3>";
        action = ":lua vim.lsp.buf.format()<CR>";
      }
      {
        mode = "i";
        options.silent = true;
        key = "<F3>";
        action = "<esc>:lua vim.lsp.buf.format()<CR>";
      }
    ];
  };
}
