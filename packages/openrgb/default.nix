{
  openrgb,
  openrgb-plugin-effects,
  ...
}:
(openrgb.withPlugins [openrgb-plugin-effects]).overrideAttrs (old: {
  patches = (old.patches or []) ++ [./force-libusb.patch];
})
