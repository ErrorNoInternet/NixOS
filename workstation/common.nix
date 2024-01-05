{
  self,
  lib,
  pkgs,
  ...
}: {
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
    supportedFilesystems = ["ntfs"];
    kernel.sysctl = {
      "kernel.sysrq" = 1;
    };
    tmp.useTmpfs = true;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  networking = {
    firewall.enable = false;
    networkmanager.enable = true;
    nameservers = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];
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
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtgraphicaleffects

    cryptsetup
    curl
    file
    git
    killall
    lsof
    neovim
    pulseaudio
    ripgrep
    tmux
    unzip
    vim
    wget
    xdg-user-dirs

    (btrfs-progs.overrideAttrs (oldAttrs: {
      patches =
        (oldAttrs.patches or [])
        ++ [
          ../packages/patches/btrfs-progs_receive-selinux.patch
        ];
    }))

    (nixVersions.nix_2_19.overrideAttrs (oldAttrs: {
      doInstallCheck = false;
      patches =
        (oldAttrs.patches or [])
        ++ [
          ../packages/patches/nix_default-flake.patch
        ];
    }))
  ];
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

  environment.etc."xdg/user-dirs.defaults".text = ''
    DESKTOP=
    TEMPLATES=
    PUBLICSHARE=
    DOCUMENTS=
    MUSIC=
    PICTURES=
    VIDEOS=
  '';
  users.users.ryan = {
    initialPassword = "snowflake";
    isNormalUser = true;
    extraGroups = ["wheel" "video" "networkmanager"];
  };

  environment.etc."nixos/current".source = ./.;
  system.stateVersion = "23.05";
}
