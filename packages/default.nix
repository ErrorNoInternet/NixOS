{
  config ? {},
  inputs',
  pkgs,
  self,
  system,
  ...
}: let
  packages = [
    {
      name = "alejandra";
      path = ./alejandra;
    }
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

  defaultArchitectures = {
    x86_64-linux = "x86-64-v3";
  };
in
  builtins.listToAttrs (map (package: {
      inherit (package) name;
      value = pkgs.callPackage package.path {
        inherit inputs' self;
        host = {
          inherit system;
          architectures =
            if (config ? host)
            then {${config.host.system} = config.host.architecture;}
            else defaultArchitectures;
        };
      };
    })
    packages)
