{
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib) mkDefault;
in {
  imports = [
    ./fonts.nix
    ./modules
    ./profiles
    ./programs
    ./specialisations
    ./unfree.nix
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
    timeout = 1;
  };

  nixos.wireless.enable = true;
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

    gnome.gnome-keyring.enable = true;

    logind.lidSwitch = mkDefault "ignore";
  };

  security.pam.services.swaylock = {};

  systemd.coredump.extraConfig = ''
    ProcessSizeMax=2G
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
      glxinfo
      home-manager
      intel-gpu-tools
      mangohud
      pulseaudio
      qalculate-gtk

      btdu
      compsize
      cryptsetup
      duperemove
      parted
      python3Packages.btrfs
      vmtouch
    ];
  };

  programs = {
    dconf.enable = true;
    fuse.userAllowOther = true;
    light.enable = true;
  };

  users.users = {
    root.initialPassword = "snowflake";
    error = {
      isNormalUser = true;
      extraGroups = ["wheel" "video"];
      initialPassword = "snowflake";
      openssh.authorizedKeys.keys = with (import "${self}/shared/ssh-keys.nix"); [msix ErrorNoPhone];
    };
  };
}
