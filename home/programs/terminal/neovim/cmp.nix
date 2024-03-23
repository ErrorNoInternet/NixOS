{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      cmp = {
        enable = true;

        settings = {
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          sources = map (name: {inherit name;}) [
            "buffer"
            "calc"
            "crates"
            "luasnip"
            "nvim_lsp"
            "path"
            "treesitter"
          ];
        };
        cmdline =
          (builtins.listToAttrs (map (name: {
              inherit name;
              value.sources = [{name = "buffer";}];
            })
            ["/" "?"]))
          // {":".sources = [{name = "path";}];};
      };

      cmp-calc.enable = true;

      cmp-treesitter.enable = true;

      cmp_luasnip.enable = true;

      luasnip = {
        enable = true;
        fromVscode = [{}];
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      friendly-snippets
    ];
  };
}
