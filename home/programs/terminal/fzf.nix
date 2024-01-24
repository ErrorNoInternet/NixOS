{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.home.programs.terminal.fish.enable {
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;

      colors = with config.colors.scheme.colors; {
        "fg" = "#${base05}";
        "fg+" = "#${base05}";
        "bg" = "#${base01}";
        "bg+" = "#${base01}";
        "hl" = "#${base0D}";
        "hl+" = "#${base0D}";
        "info" = "#${base0A}";
        "prompt" = "#${base08}";
        "pointer" = "#${base0E}";
        "marker" = "#${base0B}";
        "spinner" = "#${base0E}";
        "header" = "#${base0B}";
      };
    };
  };
}
