{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    code-minimap
  ];
  programs.nixvim = {
    options = {
      cursorline = true;
      foldlevelstart = 99;
      guicursor = "";
      number = true;
      shortmess = "ltToOCFcI";
      showmode = false;
      smoothscroll = true;
    };
    extraConfigLuaPre = ''
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = '1'
    '';

    colorschemes.nord = {
      enable = true;
      disable_background = true;
      borders = true;
      italic = false;
    };

    extraConfigVim = ''
      aunmenu PopUp.How-to\ disable\ mouse
      aunmenu PopUp.-1-

      echo ""
    '';

    plugins = {
      nvim-ufo.enable = true;

      undotree.enable = true;

      fidget = {
        enable = true;
        extraOptions = {
          notification.window.winblend = 0;
          progress.lsp.progress_ringbuf_size = 1024;
        };
      };

      indent-blankline = {
        enable = true;
        extraOptions = {
          indent.char = "";
          scope = {
            show_start = false;
            show_end = false;
          };
        };
      };

      nvim-colorizer = {
        enable = true;
        fileTypes = ["*"];
        userDefaultOptions = {
          names = false;
          RRGGBBAA = true;
          rgb_fn = true;
          hsl_fn = true;
        };
      };

      lualine.enable = true;

      bufferline.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      minimap-vim
    ];
    globals = {
      minimap_auto_start = 1;
      minimap_auto_start_win_enter = 1;
      minimap_width = 14;
      minimap_highlight_search = 1;
      minimap_git_colors = 1;
      minimap_background_processing = 1;
      minimap_base_highlight = "CustomMinimapHighlight";

      minimap_diff_color = "CustomMinimapDiffLine";
      minimap_diffadd_color = "CustomMinimapDiffAdded";
      minimap_diffremove_color = "CustomMinimapDiffRemoved";

      minimap_range_color = "CustomMinimapRange";
      minimap_range_diff_color = "CustomMinimapRangeDiffLine";
      minimap_range_diffadd_color = "CustomMinimapRangeDiffAdded";
      minimap_range_diffremove_color = "CustomMinimapRangeDiffRemoved";

      minimap_cursor_color = "CustomMinimapCursor";
      minimap_cursor_diff_color = "CustomMinimapCursorDiffLine";
      minimap_cursor_diffadd_color = "CustomMinimapCursorDiffAdded";
      minimap_cursor_diffremove_color = "CustomMinimapCursorDiffRemoved";
    };
  };
}
