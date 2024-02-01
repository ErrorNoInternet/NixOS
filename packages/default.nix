{inputs, ...}: {
  imports = [
    ./custom
  ];

  systems = ["x86_64-linux" "aarch64-linux"];
  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      nix = nixVersions.nix_2_19.overrideAttrs (oldAttrs: {
        doInstallCheck = false;
        patches =
          (oldAttrs.patches or [])
          ++ [./patches/nix_default-flake.patch];
      });

      btrfs-progs = btrfs-progs.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [./patches/btrfs-progs_receive-selinux.patch];
      });

      yazi = inputs.yazi.packages.${system}.yazi.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [];
      });

      neovim = inputs.neovim-nightly.packages.${system}.neovim.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [./patches/neovim_no-fold-numbers.patch];
      });

      attic = inputs.attic.packages.${system}.attic.overrideAttrs (oldAttrs: {
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

      wezterm = inputs.wezterm.packages.${system}.default.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [./patches/wezterm_optimized-build.patch];
      });
    };
  };
}
