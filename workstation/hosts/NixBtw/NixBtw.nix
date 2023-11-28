{
  pkgs,
  ...
}: {
  environment.variables.HOSTNAME = "NixBtw";
  networking = {
    hostName = "NixBtw";
    hostId = "102f58f5";
  };

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

  nix.gc.automatic = false;
  boot.kernelPackages = pkgs.linuxPackages_testing;

  services.udev.extraRules = ''
    SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1770", ATTRS{idProduct}=="ff00", TAG+="uaccess", TAG+="MSI_3Zone_Laptop"
  '';

  systemd.services.lock_intel_gpu_frequency = {
    path = with pkgs; [
      intel-gpu-tools
    ];
    script = "intel_gpu_frequency -m";
    wantedBy = ["multi-user.target"];
  };
}
