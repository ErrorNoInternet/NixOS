{config, ...}: {
  programs.nixvim.highlight = {
    CursorLine.bg = "none";
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
    CocFloating.bg = "#${config.colorScheme.colors.base01}";
    CocSearch.fg = "#${config.colorScheme.colors.base0D}";
    CocInlayHint.fg = "#${config.colorScheme.colors.base07}";
    "@ibl.indent.char.1".fg = "#${config.colorScheme.colors.base00}";
  };
}
