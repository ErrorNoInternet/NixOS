{config, ...}: {
  imports = [
    ./dap.nix
    ./minimap.nix
  ];

  programs.nixvim = with config.colors.scheme.palette; {
    highlightOverride = {
      CursorLine.bg = "none";
      WinSeparator.link = "VertSplit";
      Title = {
        bg = "#${base00}";
        bold = true;
      };
      HighlightUndo = {
        bg = "#${base03}";
        fg = "none";
      };
      RadarBackground.fg = "#${base03}";
      RadarMark.fg = "#${base04}";

      BufferCurrentSign = {
        fg = "#${base0D}";
        bg = "#${base01}";
      };
      BufferInactiveSign = {
        fg = "#${base03}";
        bg = "#${base00}";
      };

      NeoTreeCursorLine.bg = "#${base03}";
      NeoTreeDimText.fg = "#${base03}";
      NeoTreeFileStats.fg = "#${base03}";
      NeoTreeFileStatsHeader.fg = "#${base03}";
      NeoTreeGitConflict.fg = "#${base08}";
      NeoTreeGitIgnored.fg = "#${base03}";
      NeoTreeGitUnstaged.fg = "#${base0A}";
      NeoTreeGitUntracked.fg = "#${base0D}";
      NeoTreeNormal.bg = "#${base01}";
      NeoTreeNormalNC.bg = "#${base01}";
      NeoTreeRootName = {
        bold = true;
        italic = false;
      };
      NeoTreeTitleBar.bg = "#${base03}";

      OutlineNormal.bg = "#${base01}";
      TroubleNormal.bg = "#${base00}";

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
      LspInlayHint.fg = "#${base0F}";
      "@variable".bold = false;
      "@property".fg = "#${base0D}";
      Function.bold = true;
      Macro = {
        fg = "#${base0D}";
        bold = true;
      };
      RustEnumVariant.fg = "#${base0C}";
    };
  };
}
