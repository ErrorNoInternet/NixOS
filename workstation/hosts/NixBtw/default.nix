{pkgs, ...}: {
  imports = [
    ./nas-mounts.nix
  ];
  host.id = "102f58f5";

  boot = {
    initrd.kernelModules = ["i915"];
    kernel.sysctl = {
      "dev.i915.perf_stream_paranoid" = 0;
    };
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

  services = {
    zfs.autoSnapshot = {
      enable = true;
      monthly = 1;
    };
  };

  nix.gc.automatic = false;
}
