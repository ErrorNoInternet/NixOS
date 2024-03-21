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

      extraOptions = {
        timeout_ms = 10000;
        lsp_fallback = true;
      };

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
