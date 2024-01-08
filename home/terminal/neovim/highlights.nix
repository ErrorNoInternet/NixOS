{config, ...}: {
  programs.nixvim = {
    highlight = {
      CursorLine.bg = "none";
      WinSeparator.link = "VertSplit";

      BufferCurrentSign = {
        fg = "#${config.colorScheme.colors.base0D}";
        bg = "#${config.colorScheme.colors.base01}";
      };
      BufferInactive = {
        fg = "#${config.colorScheme.colors.base03}";
        bg = "#${config.colorScheme.colors.base01}";
      };
      BufferInactiveSign = {
        fg = "#${config.colorScheme.colors.base03}";
        bg = "#${config.colorScheme.colors.base01}";
      };
      BufferTabpageFill.bg = "#${config.colorScheme.colors.base01}";

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
  };
}
