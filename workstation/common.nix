{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkDefault;
in {
  imports = [
    ./fonts.nix
    ./kernel.nix
    ./modules
    ./profiles
    ./programs
  ];

  boot.loader = {
    grub = {
      enable = mkDefault true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      device = "nodev";
      splashImage = null;

      configurationLimit = 100;
    };
    timeout = 3;
  };

  shared.wireless.enable = true;
  networking.firewall.enable = mkDefault false;

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
      displayManager.lightdm.enable = false;
    };

    dbus.implementation = "broker";
    gnome.gnome-keyring.enable = true;

    logind.lidSwitch = mkDefault "ignore";
  };

  security.pam.services.swaylock = {};

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };
    mime.defaultApplications = {
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
    };
  };

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
      cryptsetup
      glxinfo
      home-manager
      intel-gpu-tools
      mangohud
      parted
      pulseaudio
      qalculate-gtk
    ];
  };

  programs = {
    dconf.enable = true;
    firefox.enable = true;
    light.enable = true;
    neovim.defaultEditor = true;
  };

  users.users = {
    root.initialPassword = "snowflake";
    error = {
      isNormalUser = true;
      extraGroups = ["wheel" "video"];
      initialPassword = "snowflake";
      openssh.authorizedKeys.keys = with (import ../shared/values/ssh-keys.nix); [NixBtw ErrorNoPhone];
    };
  };
}
