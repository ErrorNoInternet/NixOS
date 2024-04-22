{
  callPackage,
  host,
  inputs',
  self,
  ...
}:
(inputs'.hyprland.packages.xdg-desktop-portal-hyprland.overrideAttrs (old: {
  patches = (old.patches or []) ++ [./move-checkbox.patch];
}))
.override {
  slurp = callPackage ../slurp {inherit host self;};
  hyprland = callPackage ../hyprland {inherit host inputs' self;};
}
