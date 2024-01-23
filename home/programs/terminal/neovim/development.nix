{pkgs, ...}: {
  programs.nixvim = {helpers, ...}: {
    extraPackages = with pkgs; [
      alejandra
      black
      clang-tools
      lldb
    ];

    plugins = {
      markdown-preview.enable = true;

      nix-develop.enable = true;

      gitblame.enable = true;

      todo-comments.enable = true;

      commentary.enable = true;

      nvim-autopairs.enable = true;

      dap = {
        enable = true;
        extensions = {
          dap-ui.enable = true;
          dap-virtual-text.enable = true;

          dap-python.enable = true;
        };

        adapters.executables.lldb.command = "lldb-vscode";
        configurations = let
          lldb = ["rust" "c" "cpp" "zig"];
        in
          builtins.listToAttrs (map (language: {
              name = "${language}";
              value = [
                {
                  name = "Launch";
                  request = "launch";
                  type = "lldb";
                  program = helpers.mkRaw ''
                    function()
                      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end
                  '';
                  cwd = "\${workspaceFolder}";
                }
              ];
            })
            lldb);
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      neoformat
    ];
    extraConfigLuaPost = ''
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    '';
    globals.gitblame_enabled = 0;
  };
}
