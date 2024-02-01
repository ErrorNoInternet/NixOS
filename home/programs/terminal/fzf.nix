{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.home.programs.terminal.fish.enable {
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;

      colors = with config.colorScheme.colors; {
        "bg+" = "#${base03}";
        "border" = "#${base03}";
        "fg" = "#${base05}";
        "fg+" = "#${base05}";
        "header" = "#${base0B}";
        "hl" = "#${base0D}";
        "hl+" = "#${base0D}";
        "info" = "#${base0D}";
        "marker" = "#${base0F}";
        "pointer" = "#${base0D}";
        "prompt" = "#${base04}";
        "spinner" = "#${base07}";
      };
    };
  };
}
