{config, ...}: {
  programs.nixvim = with config.colors.scheme.colors; {
    highlight = {
      CursorLine.bg = "none";
      WinSeparator.link = "VertSplit";
      Title = {
        bg = "#${base00}";
        bold = true;
      };

      BufferCurrentSign = {
        fg = "#${base0D}";
        bg = "#${base01}";
      };
      BufferInactiveSign = {
        fg = "#${base03}";
        bg = "#${base00}";
      };

      NvimTreeNormal.bg = "#${base01}";
      NvimTreeCursorLine.bg = "#${base03}";

      HighlightUndo = {
        bg = "#${base03}";
        fg = "none";
      };

      RadarBackground.fg = "#${base03}";
      RadarMark.fg = "#${base04}";

      FoldColumn.fg = "#${base03}";
      "@ibl.indent.char.1".fg = "#${base00}";
      SagaVirtLine.fg = "#${base03}";
      TreesitterContextLineNumber = {
        fg = "#${base03}";
        bg = "#${base00}";
      };
      MatchParen = {
        fg = "#${base0D}";
        bg = "#${base03}";
      };
      "@variable".bold = false;
      Function.bold = true;
      Macro = {
        fg = "#${base0D}";
        bold = true;
      };
      RustEnumVariant.fg = "#${base0C}";

      WinBar.bg = "#${base00}";
      WinBarNC.bg = "#${base00}";
      DapUIUnavailable = {
        fg = "#${base03}";
        bg = "#${base00}";
      };
      DapUIPlayPauseNC = {
        fg = "#${base0B}";
        bg = "#${base00}";
      };
      DapUIStepOverNC = {
        fg = "#${base0C}";
        bg = "#${base00}";
      };
      DapUIStepIntoNC = {
        fg = "#${base0C}";
        bg = "#${base00}";
      };
      DapUIStepBackNC = {
        fg = "#${base0C}";
        bg = "#${base00}";
      };
      DapUIStepOutNC = {
        fg = "#${base0C}";
        bg = "#${base00}";
      };
      DapUIRestartNC = {
        fg = "#${base0B}";
        bg = "#${base00}";
      };
      DapUIStopNC = {
        fg = "#${base08}";
        bg = "#${base00}";
      };
      DapUIUnavailableNC = {
        fg = "#${base03}";
        bg = "#${base00}";
      };
      DapUIPlayPause = {
        fg = "#${base0B}";
        bg = "#${base00}";
      };
      DapUIStepOver = {
        fg = "#${base0C}";
        bg = "#${base00}";
      };
      DapUIStepInto = {
        fg = "#${base0C}";
        bg = "#${base00}";
      };
      DapUIStepBack = {
        fg = "#${base0C}";
        bg = "#${base00}";
      };
      DapUIStepOut = {
        fg = "#${base0C}";
        bg = "#${base00}";
      };
      DapUIRestart = {
        fg = "#${base0B}";
        bg = "#${base00}";
      };
      DapUIStop = {
        fg = "#${base08}";
        bg = "#${base00}";
      };

      CustomMinimapHighlight = {
        bg = "#${base01}";
        fg = "#${base04}";
      };
      CustomMinimapDiffLine = {
        bg = "#${base01}";
        fg = "#${base0E}";
      };
      CustomMinimapDiffAdded = {
        bg = "#${base01}";
        fg = "#${base0B}";
      };
      CustomMinimapDiffRemoved = {
        bg = "#${base01}";
        fg = "#${base08}";
      };
      CustomMinimapRange = {
        bg = "#${base02}";
        fg = "#${base04}";
      };
      CustomMinimapRangeDiffLine = {
        bg = "#${base02}";
        fg = "#${base0E}";
      };
      CustomMinimapRangeDiffAdded = {
        bg = "#${base02}";
        fg = "#${base0B}";
      };
      CustomMinimapRangeDiffRemoved = {
        bg = "#${base02}";
        fg = "#${base08}";
      };
      CustomMinimapCursor = {
        bg = "#${base03}";
        fg = "#${base06}";
      };
      CustomMinimapCursorDiffLine = {
        bg = "#${base03}";
        fg = "#${base0E}";
      };
      CustomMinimapCursorDiffAdded = {
        bg = "#${base03}";
        fg = "#${base0B}";
      };
      CustomMinimapCursorDiffRemoved = {
        bg = "#${base03}";
        fg = "#${base08}";
      };
    };
  };
}
