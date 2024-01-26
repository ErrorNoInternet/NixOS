{pkgs, ...}: {
  home.packages = [pkgs.code-minimap];
  programs.nixvim = {
    options = {
      cursorline = true;
      foldcolumn = "1";
      foldlevelstart = 99;
      guicursor = "";
      number = true;
      scrolloff = 5;
      shortmess = "ltToOCFcI";
      showmode = false;
      smoothscroll = true;
    };
    extraConfigLuaPre = ''
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    '';

    extraConfigVim = ''
      aunmenu PopUp.How-to\ disable\ mouse
      aunmenu PopUp.-1-

      echo " "
    '';

    colorschemes.nord = {
      enable = true;
      disableBackground = true;
      borders = true;
      italic = false;
    };

    plugins = {
      mark-radar.enable = true;

      nvim-tree = {
        enable = true;
        disableNetrw = true;
        extraOptions.view.signcolumn = "no";
      };

      undotree.enable = true;

      fidget = {
        enable = true;
        extraOptions = {
          notification.window.winblend = 0;
          progress = {
            display.group_style = "@boolean";
            lsp.progress_ringbuf_size = 1024;
          };
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
      };

      barbar = {
        enable = true;
        minimumPadding = 1;
        maximumPadding = 3;
        icons = {
          button = false;
          diagnostics = {
            error.enable = true;
            hint.enable = true;
            info.enable = true;
            warn.enable = true;
          };
        };
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      highlight-undo-nvim
      minimap-vim
      nvim-ufo
    ];
    extraConfigLuaPost = ''
      require('highlight-undo').setup()

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
      }
      local language_servers = require("lspconfig").util.available_servers()
      for _, ls in ipairs(language_servers) do
          require('lspconfig')[ls].setup({
              capabilities = capabilities
          })
      end
      require('ufo').setup {
        preview = {
          win_config = {
            winblend = 0,
            winhighlight = "NvimTreeNormal:NvimTreeNormal",
          },
        },
      }
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
