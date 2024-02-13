{
  imports = [
    ./custom
  ];

  systems = ["x86_64-linux" "aarch64-linux"];
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    packages = with pkgs; {
      nix = inputs'.nix-super.packages.default.overrideAttrs (_: {
        doInstallCheck = false;
      });

      btrfs-progs = btrfs-progs.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [./patches/btrfs-progs_receive-selinux.patch];
      });

      inherit (inputs'.yazi.packages) yazi;

      neovim = inputs'.neovim-nightly.packages.neovim.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [./patches/neovim_no-fold-numbers.patch];
      });

      attic = inputs'.attic.packages.attic.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [
            ./patches/attic_https-api-endpoint.patch
            ./patches/attic_optimized-build.patch
          ];
      });

      nordic = nordic.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [./patches/nordic_transparent-context-menu.patch];
      });

      kitty = kitty.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [
            ./patches/kitty_hide-resize-text.patch
            ./patches/kitty_parse-base10-rgb.patch
          ];
      });

      wezterm = inputs'.wezterm.packages.default.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [./patches/wezterm_optimized-build.patch];
      });

      openrgb = openrgb.withPlugins [openrgb-plugin-effects];
      openrgb-libusb = (openrgb.withPlugins [openrgb-plugin-effects]).overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [./patches/openrgb_force-libusb.patch];
      });
    };
  };
}
