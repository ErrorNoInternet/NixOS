{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      code-minimap
    ];

    options = {
      cursorline = true;
      foldcolumn = "1";
      foldlevelstart = 99;
      number = true;
      scrolloff = 5;
      shortmess = "ltToOCFcI";
      showmode = false;
      smoothscroll = true;
    };
    extraConfigLuaPre = ''
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    '';

    extraConfigVim = ''
      aunmenu PopUp.How-to\ disable\ mouse
      aunmenu PopUp.-1-

      echo " "
    '';

    colorschemes.nord = {
      enable = true;
      settings = {
        borders = true;
        disable_background = true;
        italic = false;
      };
    };

    plugins = {
      nvim-tree = {
        enable = true;
        disableNetrw = true;
        diagnostics = {
          enable = true;
          showOnDirs = true;
        };
        extraOptions = {
          view.signcolumn = "no";
          renderer.icons.diagnostics_placement = "before";
        };
      };

      undotree.enable = true;

      mark-radar.enable = true;

      fidget = {
        enable = true;
        extraOptions = {
          notification.window.winblend = 0;
          progress = {
            display.group_style = "@string";
            lsp.progress_ringbuf_size = 1024;
          };
        };
      };

      nvim-ufo = {
        enable = true;
        preview.winConfig = {
          winblend = 0;
          winhighlight = "NvimTreeNormal:NvimTreeNormal";
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

      telescope = {
        enable = true;
        extensions.ui-select.enable = true;

        defaults.layout_strategy = "vertical";
      };
      yanky = {
        enable = true;
        picker.telescope.enable = true;
        highlight = {
          onPut = false;
          onYank = false;
        };
      };

      navic = {
        enable = true;
        lsp.autoAttach = true;
      };
      lualine = {
        enable = true;
        componentSeparators = {
          left = "|";
          right = "|";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };

        sections.lualine_c = ["filename" "navic"];
      };

      barbar = {
        enable = true;
        minimumPadding = 1;
        maximumPadding = 3;
        icons.button = false;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      highlight-undo-nvim
      minimap-vim
    ];
    extraConfigLuaPost = ''
      require('highlight-undo').setup()
    '';
    globals = {
      undotree_HelpLine = 0;

      minimap_width = 14;
      minimap_highlight_search = 1;
      minimap_git_colors = 1;
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
