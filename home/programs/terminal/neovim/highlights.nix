{config, ...}:
with config.colorScheme.colors; {
  programs.nixvim = {
    highlight = {
      CursorLine.bg = "none";
      WinSeparator.link = "VertSplit";
      Title.bg = "#${base00}";

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

      "@ibl.indent.char.1".fg = "#${base00}";
      FoldColumn.fg = "#${base03}";
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
