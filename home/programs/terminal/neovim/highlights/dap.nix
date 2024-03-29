{config, ...}: {
  programs.nixvim.highlightOverride = with config.colors.scheme.palette; {
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
  };
}
