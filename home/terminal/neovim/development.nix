{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      markdown-preview.enable = true;
      nix-develop.enable = true;
      nvim-autopairs.enable = true;
    };
    extraConfigLuaPost = ''
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    '';
    extraConfigVim = ''
      function FormatCBuffer()
        let cursor_pos = getpos('.')
        :%!${pkgs.clang-tools}/bin/clang-format
        call setpos('.', cursor_pos)
      endfunction

      function FormatZigBuffer()
        let cursor_pos = getpos('.')
        :%!${pkgs.zig}/bin/zig fmt --stdin
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
