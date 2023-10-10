{ custom, ... }:

{
  gtk = {
    enable = true;
    theme = custom.gtkTheme;
    iconTheme = custom.gtkIconTheme;
  };
}
