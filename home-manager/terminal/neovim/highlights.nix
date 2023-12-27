{config, ...}: {
  programs.nixvim = {
    highlight = {
      CursorLine.bg = "none";
      WinSeparator.link = "VertSplit";

      NvimTreeNormal.bg = "#${config.colorScheme.colors.base01}";
      NvimTreeCursorLine.bg = "#${config.colorScheme.colors.base03}";

      "@ibl.indent.char.1".fg = "#${config.colorScheme.colors.base00}";
      FoldColumn.fg = "#${config.colorScheme.colors.base03}";
      MatchParen = {
        fg = "#${config.colorScheme.colors.base0D}";
        bg = "#${config.colorScheme.colors.base03}";
      };
      "@variable".bold = false;
      Function.bold = true;
      Macro = {
        fg = "#${config.colorScheme.colors.base0D}";
        bold = true;
      };
      RustEnumVariant.fg = "#${config.colorScheme.colors.base0C}";

      CustomMinimapHighlight = {
        bg = "#${config.colorScheme.colors.base01}";
        fg = "#${config.colorScheme.colors.base04}";
      };
      CustomMinimapDiffLine = {
        bg = "#${config.colorScheme.colors.base01}";
        fg = "#${config.colorScheme.colors.base0E}";
      };
      CustomMinimapDiffAdded = {
        bg = "#${config.colorScheme.colors.base01}";
        fg = "#${config.colorScheme.colors.base0B}";
      };
      CustomMinimapDiffRemoved = {
        bg = "#${config.colorScheme.colors.base01}";
        fg = "#${config.colorScheme.colors.base08}";
      };

      CustomMinimapRange = {
        bg = "#${config.colorScheme.colors.base02}";
        fg = "#${config.colorScheme.colors.base04}";
      };
      CustomMinimapRangeDiffLine = {
        bg = "#${config.colorScheme.colors.base02}";
        fg = "#${config.colorScheme.colors.base0E}";
      };
      CustomMinimapRangeDiffAdded = {
        bg = "#${config.colorScheme.colors.base02}";
        fg = "#${config.colorScheme.colors.base0B}";
      };
      CustomMinimapRangeDiffRemoved = {
        bg = "#${config.colorScheme.colors.base02}";
        fg = "#${config.colorScheme.colors.base08}";
      };

      CustomMinimapCursor = {
        bg = "#${config.colorScheme.colors.base03}";
        fg = "#${config.colorScheme.colors.base06}";
      };
      CustomMinimapCursorDiffLine = {
        bg = "#${config.colorScheme.colors.base03}";
        fg = "#${config.colorScheme.colors.base0E}";
      };
      CustomMinimapCursorDiffAdded = {
        bg = "#${config.colorScheme.colors.base03}";
        fg = "#${config.colorScheme.colors.base0B}";
      };
      CustomMinimapCursorDiffRemoved = {
        bg = "#${config.colorScheme.colors.base03}";
        fg = "#${config.colorScheme.colors.base08}";
      };
    };

    plugins.bufferline.highlights = {
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
}
