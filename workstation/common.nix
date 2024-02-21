{
  inputs',
  inputs,
  lib,
  pkgs,
  self',
  self,
  ...
}: {
  imports = [
    ../shared
    ./modules
    ./profiles
    ./programs
    ./specialisations
    inputs.agenix.nixosModules.default

    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {inherit inputs' inputs self' self;};

        users.error = {...}: {
          imports = [
            ../home/common.nix
            ../home/hosts/NixBtw.nix
          ];
        };
      };
    }
  ];

  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        device = "nodev";
        splashImage = null;

        configurationLimit = 100;
      };
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
          theme = "${self'.packages.sddm-theme-corners}";
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
    etc."xdg/user-dirs.defaults".text = ''
      DESKTOP=
      TEMPLATES=
      PUBLICSHARE=
      DOCUMENTS=
      MUSIC=
      PICTURES=
      VIDEOS=
    '';

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

  users.users = {
    root.initialPassword = "snowflake";
    error = {
      isNormalUser = true;
      extraGroups = ["wheel" "video" "networkmanager"];
      initialPassword = "snowflake";
      openssh.authorizedKeys.keys = let
        keys = import ../shared/values/ssh-keys.nix;
      in
        with keys; [NixBtw ErrorNoPhone];
    };
  };
}
