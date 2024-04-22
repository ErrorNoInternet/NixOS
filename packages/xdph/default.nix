{xdg-desktop-portal-hyprland, ...}:
xdg-desktop-portal-hyprland.overrideAttrs (old: {
  patches = (old.patches or []) ++ [./move-checkbox.patch];
})
