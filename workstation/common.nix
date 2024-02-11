{
  inputs,
  inputs',
  lib,
  pkgs,
  self',
  ...
}: {
  imports = [
    ../shared
    ./modules
    ./profiles
    ./programs
    inputs.agenix.nixosModules.default

    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {inherit inputs' inputs self';};

        users.error = {...}: {
          imports = [
            ../home/common.nix
            ../home/hosts/NixBtw.nix
          ];
        };
      };
    }
  ];

  specialisation.outside.configuration = {
    caches.ErrorNoBinaries = {
      internal = false;
      external = true;
    };
  };

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 100;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
      timeout = 3;
    };

    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
    supportedFilesystems = [
      "ntfs"
    ];

    kernel.sysctl = {
      "kernel.sysrq" = 1;
    };

    tmp = {
      useTmpfs = true;
      tmpfsSize = "100%";
    };
  };

  networking = {
    firewall.enable = false;
    networkmanager.enable = true;
  };

  services = {
    openssh.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
      displayManager = {
        lightdm.enable = false;
        sddm = {
          enable = true;
          theme = "${self'.packages.sddm-theme}";
        };
      };
    };

    dbus.implementation = "broker";
    gnome.gnome-keyring.enable = true;

    logind.lidSwitch = "ignore";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
  security.pam.services.swaylock = {};

  systemd.coredump.extraConfig = ''
    ProcessSizeMax=4G
    ExternalSizeMax=512M
  '';

  environment = {
    etc = {
      "nixos/current".source = ./.;

      "xdg/user-dirs.defaults".text = ''
        DESKTOP=
        TEMPLATES=
        PUBLICSHARE=
        DOCUMENTS=
        MUSIC=
        PICTURES=
        VIDEOS=
      '';
    };

    systemPackages = with pkgs; [
      libsForQt5.qt5.qtgraphicaleffects

      bcachefs-tools
      cryptsetup
      home-manager
      pulseaudio
      self'.packages.btrfs-progs
      self'.packages.nix
      xdg-user-dirs
    ];
  };
  programs = {
    dconf.enable = true;
    light.enable = true;
    gnupg = {
      agent.enable = true;
      dirmngr.enable = true;
    };
    neovim.defaultEditor = true;
  };

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      source-han-sans
      source-han-serif
      twitter-color-emoji
    ];
    fontconfig = {
      defaultFonts = {
        serif = [
          "JetBrainsMono Nerd Font"
          "Noto Serif CJK SC"
        ];
        sansSerif = [
          "JetBrainsMono Nerd Font"
          "Noto Sans CJK SC"
        ];
        monospace = ["JetBrainsMono Nerd Font"];
        emoji = ["Twitter Color Emoji"];
      };
    };
  };

  users.users.error = {
    initialPassword = "snowflake";
    isNormalUser = true;
    extraGroups = ["wheel" "video" "networkmanager"];
  };

  system.stateVersion = "23.05";
}
