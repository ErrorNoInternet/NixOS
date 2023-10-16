{ inputs, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix = {
    trustedUsers = [ "root" "@wheel" ];
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    extraOptions = ''
      min-free = ${toString (1024 * 1024 * 1024 * 5)}
      max-free = ${toString (1024 * 1024 * 1024 * 10)}
    '';
  };

  i18n.defaultLocale = "en_US.UTF-8";
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 3;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "ntfs" ];
  };
  networking = {
    firewall.enable = false;
    networkmanager.enable = true;
    nameservers = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];
  };
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };
  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    displayManager = {
      lightdm.enable = false;
      sddm = {
        enable = true;
        theme = "${import ./derivations/sddm-theme.nix { inherit pkgs; }}";
      };
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtgraphicaleffects

    vim
    neovim
    wget
    curl
    unzip
    file
    killall
    pulseaudio
    xdg-user-dirs

    python310Packages.jedi
  ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };
  programs.dconf.enable = true;
  programs.light.enable = true;
  programs.gnupg.agent.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.openssh.enable = true;

  environment.shells = with pkgs; [ zsh ];
  programs.neovim.defaultEditor = true;
  security.pam.services.swaylock = {};
  services.logind.lidSwitch = "ignore";
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
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
        monospace = [ "JetBrainsMono Nerd Font" ];
        emoji = [ "Twitter Color Emoji" ];
      };
    };
  };

  environment.etc."xdg/user-dirs.defaults".text=''
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
    extraGroups = [ "wheel" "video" ];
    shell = pkgs.zsh;
  };

  environment.etc."current-nixos".source = ./.;
  system.stateVersion = "23.05";
}
