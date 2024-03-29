{config, ...}: {
  programs.nixvim = {
    highlightOverride = with config.colors.scheme.palette; {
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

    globals = {
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
