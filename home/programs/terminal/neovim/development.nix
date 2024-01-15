{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      markdown-preview.enable = true;

      nix-develop.enable = true;

      gitblame.enable = true;

      todo-comments.enable = true;

      nvim-autopairs.enable = true;
    };
    globals.gitblame_enabled = 0;
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
        let formatted = system('${pkgs.zig}/bin/zig fmt --stdin', join(getline(1, '$'), "\n"))
        if v:shell_error == 0
          call setline(1, split(formatted, "\n"))
        else
          echohl ErrorMsg | echo "format error: " . formatted | echohl None
        endif
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
