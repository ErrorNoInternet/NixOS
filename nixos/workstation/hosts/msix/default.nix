{pkgs, ...}: {
  imports = [
    ./drives.nix
    ./nas.nix
  ];

  host.architecture = "haswell";

  specialisation = let
    common.absentFileSystems = [
      "/mnt/nas/drive1"
      "/mnt/nas/drive3"
    ];
  in {
    lockdown.configuration = common;
    outside.configuration = common;
  };

  boot.extraModprobeConfig = ''
    options snd_hda_intel power_save=0
  '';

  systemd.services.lock_intel_gpu_frequency = {
    path = [pkgs.intel-gpu-tools];
    script = "intel_gpu_frequency -m";
    wantedBy = ["multi-user.target"];
  };

  services.udev.extraRules = ''
    SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1770", ATTRS{idProduct}=="ff00", TAG+="uaccess", TAG+="MSI_3Zone_Laptop"
  '';

  workstation.desktops.hyprland.enable = true;

  nix.gc.automatic = false;
}
