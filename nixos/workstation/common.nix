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
    ./kernel.nix
    ./modules
    ./profiles
    ./programs
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

    gnome.gnome-keyring.enable = true;

    logind.lidSwitch = mkDefault "ignore";
  };

  security.pam.services.swaylock = {};

  systemd = {
    user.extraConfig =
      "DefaultEnvironment=\"PATH="
      + "/run/wrappers/bin:"
      + "/etc/profiles/per-user/%u/bin:"
      + "/nix/var/nix/profiles/default/bin:"
      + "/run/current-system/sw/bin\"";

    coredump.extraConfig = ''
      ProcessSizeMax=4G
      ExternalSizeMax=512M
    '';
  };

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
    light.enable = true;
  };

  users.users = {
    root.hashedPassword = "$y$j9T$WfJxCznVCCzIRKDYZy5sY0$58VFaRawiS69TGWsDGJVWGwc1JHgQErCV9QVqLEU.r6";
    error = {
      isNormalUser = true;
      extraGroups = ["wheel" "video"];
      hashedPassword = "$y$j9T$y5Y9Is9PBhWC.XFec1Ljo/$vEKBucaLv1jYhbWZM0Dslog7cbOol/zMp9sS434X6b6";
      openssh.authorizedKeys.keys = with (import "${self}/shared/ssh-keys.nix"); [msix ErrorNoPhone];
    };
  };
}
