{
  openrgb,
  openrgb-plugin-effects,
  ...
}:
(openrgb.withPlugins [openrgb-plugin-effects]).overrideAttrs (oldAttrs: {
  patches =
    (oldAttrs.patches or [])
    ++ [./force-libusb.patch];
})
