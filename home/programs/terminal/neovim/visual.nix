{pkgs, ...}: {
  programs.nixvim = {helpers, ...}: {
    config = {
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
        signcolumn = "no";
        smoothscroll = true;
        fillchars = helpers.mkRaw "[[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]";
      };

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
        neo-tree = {
          enable = true;
          closeIfLastWindow = true;
          window.width = 32;
          popupBorderStyle = "rounded";
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
            winhighlight = "NeoTreeNormal:NeoTreeNormal";
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
        loaded_netrw = 1;
        loaded_netrwPlugin = 1;
        undotree_HelpLine = 0;
      };
    };
  };
}
