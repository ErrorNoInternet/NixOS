{
  callPackage,
  host,
  self,
  xdg-desktop-portal-hyprland,
  ...
}:
(xdg-desktop-portal-hyprland.overrideAttrs (old: {
  patches = (old.patches or []) ++ [./move-checkbox.patch];
}))
.override {
  slurp = callPackage ../slurp {inherit host self;};
}
