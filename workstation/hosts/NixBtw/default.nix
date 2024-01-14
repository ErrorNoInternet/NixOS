{pkgs, ...}: {
  imports = [
    ./nas-mount.nix
    ./snapper.nix
  ];
  host.id = "102f58f5";

  specialisation.outside.configuration = {
    absentFileSystems = ["/mnt/pi-drive1" "/mnt/pi-drive3"];
  };

  services.udev.extraRules = ''
    SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1770", ATTRS{idProduct}=="ff00", TAG+="uaccess", TAG+="MSI_3Zone_Laptop"
  '';

  systemd.services.lock_intel_gpu_frequency = {
    path = [pkgs.intel-gpu-tools];
    script = "intel_gpu_frequency -m";
    wantedBy = ["multi-user.target"];
  };

  workstation.desktops.hyprland.enable = true;

  nix.gc.automatic = false;
  # boot.kernelPackages = with pkgs;
  #   if
  #     (builtins.compareVersions
  #       linuxPackages_testing.kernel.version
  #       linuxPackages_latest.kernel.version)
  #     == -1
  #   then linuxPackages_latest
  #   else if
  #     ((builtins.match "^([0-9]+\.[0-9]+)$" linuxPackages_latest.kernel.version)
  #       == [linuxPackages_latest.kernel.version])
  #   then linuxPackages_latest
  #   else linuxPackages_testing;
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
