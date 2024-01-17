{
  inputs,
  lib,
  pkgs,
  self,
  ...
}: {
  imports = [
    ../shared
    ./modules
    ./profiles
    ./programs
    inputs.agenix.nixosModules.default
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
          theme = "${self.packages.${pkgs.system}.sddm-theme}";
        };
      };
    };

    dbus.implementation = "broker";
  };

  systemd.coredump.extraConfig = ''
    ProcessSizeMax=4G
    ExternalSizeMax=512M
  '';

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

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
      self.legacyPackages.${system}.btrfs-progs
      self.legacyPackages.${system}.nix
      xdg-user-dirs
    ];
  };
  programs = {
    dconf.enable = true;
    light.enable = true;
    gnupg.agent.enable = true;
    neovim.defaultEditor = true;
  };

  services = {
    logind.lidSwitch = "ignore";
    openssh.enable = true;
    gnome.gnome-keyring.enable = true;
  };
  security.pam.services.swaylock = {};

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
