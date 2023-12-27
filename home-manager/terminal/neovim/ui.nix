{config, ...}: {
  programs.nixvim = {
    colorschemes.nord = {
      enable = true;
      disable_background = true;
      italic = false;
    };

    extraConfigVim = ''
      aunmenu PopUp.How-to\ disable\ mouse
      aunmenu PopUp.-1-

      echo ""
    '';

    plugins = {
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

      bufferline = {
        enable = true;
        highlights = {
          separator = {
            fg = "#${config.colorScheme.colors.base00}";
            bg = "#${config.colorScheme.colors.base01}";
          };
          indicatorSelected = {
            bg = "#${config.colorScheme.colors.base03}";
          };

          fill = {bg = "#${config.colorScheme.colors.base01}";};
          background = {bg = "#${config.colorScheme.colors.base01}";};

          closeButtonSelected = {bg = "#${config.colorScheme.colors.base03}";};
          closeButtonVisible = {bg = "#${config.colorScheme.colors.base01}";};
          closeButton = {bg = "#${config.colorScheme.colors.base01}";};

          modifiedSelected = {bg = "#${config.colorScheme.colors.base03}";};
          modified = {bg = "#${config.colorScheme.colors.base01}";};

          bufferSelected = {
            bg = "#${config.colorScheme.colors.base03}";
            italic = false;
          };
          bufferVisible = {bg = "#${config.colorScheme.colors.base01}";};

          duplicateSelected = {bg = "#${config.colorScheme.colors.base03}";};
          duplicate = {bg = "#${config.colorScheme.colors.base01}";};

          errorSelected = {bg = "#${config.colorScheme.colors.base03}";};
          error = {bg = "#${config.colorScheme.colors.base01}";};
          errorDiagnosticSelected = {bg = "#${config.colorScheme.colors.base03}";};
          errorDiagnostic = {bg = "#${config.colorScheme.colors.base01}";};

          warningSelected = {bg = "#${config.colorScheme.colors.base03}";};
          warning = {bg = "#${config.colorScheme.colors.base01}";};
          warningDiagnosticSelected = {bg = "#${config.colorScheme.colors.base03}";};
          warningDiagnostic = {bg = "#${config.colorScheme.colors.base01}";};

          hintSelected = {bg = "#${config.colorScheme.colors.base03}";};
          hint = {bg = "#${config.colorScheme.colors.base01}";};
          hintDiagnosticSelected = {bg = "#${config.colorScheme.colors.base03}";};
          hintDiagnostic = {bg = "#${config.colorScheme.colors.base01}";};
        };
      };
    };
  };
}
