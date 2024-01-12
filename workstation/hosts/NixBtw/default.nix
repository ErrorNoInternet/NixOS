{pkgs, ...}: {
  imports = [
    ./snapper.nix
  ];
  host.id = "102f58f5";

  fileSystems."/mnt/pi-drive1" = {
    device = "192.168.0.100:/mnt/drive1";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto"];
  };
  fileSystems."/mnt/pi-drive3" = {
    device = "192.168.0.100:/mnt/drive3";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto"];
  };

  boot.kernelPackages = pkgs.linuxPackages_testing;

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
}
