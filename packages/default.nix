{
  inputs,
  self,
  ...
}: {
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    packages = with pkgs; let
      packages = [
        {
          name = "attic";
          path = ./attic;
        }
        {
          name = "btrfs-map-physical";
          path = ./btrfs-map-physical;
        }
        {
          name = "btrfs-progs";
          path = ./btrfs-progs;
        }
        {
          name = "foot";
          path = ./foot;
        }
        {
          name = "hwatch";
          path = ./hwatch;
        }
        {
          name = "hyprgamemode";
          path = ./hyprgamemode;
        }
        {
          name = "hyprland";
          path = ./hyprland;
        }
        {
          name = "kitty";
          path = ./kitty;
        }
        {
          name = "neovim";
          path = ./neovim;
        }
        {
          name = "nix";
          path = ./nix;
        }
        {
          name = "openrgb-libusb";
          path = ./openrgb-libusb;
        }
        {
          name = "passgen";
          path = ./passgen;
        }
        {
          name = "pavolume";
          path = ./pavolume;
        }
        {
          name = "savehw";
          path = ./savehw;
        }
        {
          name = "scratchpad";
          path = ./scratchpad;
        }
        {
          name = "tbw";
          path = ./tbw;
        }
        {
          name = "tmux";
          path = ./tmux;
        }
        {
          name = "wezterm";
          path = ./wezterm;
        }
        {
          name = "gtkTheme-nordic";
          path = ./themes/gtk/nordic;
        }
        {
          name = "fcitx5Theme-nord";
          path = ./themes/fcitx5/nord.nix;
        }
        {
          name = "sddmTheme-corners";
          path = ./themes/sddm/corners.nix;
        }
        {
          name = "vimPlugin-textobj-indent";
          path = ./plugins/vim/textobj-indent.nix;
        }
        {
          name = "yaziPlugin-keyjump";
          path = ./plugins/yazi/keyjump.nix;
        }
        {
          name = "yaziPlugin-bookmarks";
          path = ./plugins/yazi/bookmarks.nix;
        }
      ];
    in
      builtins.listToAttrs (map (package: {
          inherit (package) name;
          value = callPackage package.path {inherit inputs' inputs self system;};
        })
        packages);
  };
}
