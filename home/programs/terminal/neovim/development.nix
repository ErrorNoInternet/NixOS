{
  lib,
  pkgs,
  ...
}: {
  programs.nixvim = {helpers, ...}: {
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
                  cwd = "\${workspaceFolder}";
                  program = helpers.mkRaw ''
                    function()
                      return vim.fn.input('Executable path: ', vim.fn.getcwd() .. '/', 'file')
                    end
                  '';
                  args = helpers.mkRaw ''
                    function()
                      local arguments_string = vim.fn.input('Executable arguments: ')
                      return vim.split(arguments_string, " +")
                    end
                  '';

                  initCommands = lib.mkIf (language == "rust") (helpers.mkRaw ''
                    function()
                      local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))

                      local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
                      local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

                      local commands = {}
                      local file = io.open(commands_file, 'r')
                      if file then
                        for line in file:lines() do
                          table.insert(commands, line)
                        end
                        file:close()
                      end
                      table.insert(commands, 1, script_import)

                      return commands
                    end,
                  '');
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
