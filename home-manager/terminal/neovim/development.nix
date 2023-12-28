{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      markdown-preview.enable = true;
      nix-develop.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      nvim-autopairs
    ];
    extraConfigLuaPost = ''
      local npairs = require('nvim-autopairs')
      npairs.setup({ map_bs = false, map_cr = false })

      local remap = vim.api.nvim_set_keymap
      _G.MUtils= {}

      remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
      remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
      remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
      remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

      MUtils.CR = function()
        if vim.fn.pumvisible() ~= 0 then
          if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
            return npairs.esc('<c-y>')
          else
            return npairs.esc('<c-e>') .. npairs.autopairs_cr()
          end
        else
          return npairs.autopairs_cr()
        end
      end

      MUtils.BS = function()
        if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
          return npairs.esc('<c-e>') .. npairs.autopairs_bs()
        else
          return npairs.autopairs_bs()
        end
      end

      remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })
      remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
    '';
    extraConfigVim = ''
      function FormatCBuffer()
        let cursor_pos = getpos('.')
        :%!${pkgs.clang-tools}/bin/clang-format --fallback-style="{BasedOnStyle: llvm, IndentWidth: 4}"
        call setpos('.', cursor_pos)
      endfunction

      function FormatPythonBuffer()
        let cursor_pos = getpos('.')
        :%!${pkgs.black}/bin/black - 2>/dev/null
        call setpos('.', cursor_pos)
      endfunction

      function FormatNixBuffer()
        let cursor_pos = getpos('.')
        :%!${pkgs.alejandra}/bin/alejandra - 2>/dev/null
        call setpos('.', cursor_pos)
      endfunction
    '';
  };
}
