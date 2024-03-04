{pkgs, ...}: {
  imports = [
    ./drives.nix
    ./nas-mounts.nix
  ];
  host.id = "102f58f5";

  specialisation = let
    absentFileSystems = ["/mnt/nas-drive1" "/mnt/nas-drive3"];
  in {
    lockdown.configuration = {inherit absentFileSystems;};
    outside.configuration = {inherit absentFileSystems;};
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;

  services.udev.extraRules = ''
    SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1770", ATTRS{idProduct}=="ff00", TAG+="uaccess", TAG+="MSI_3Zone_Laptop"
  '';

  systemd.services.lock_intel_gpu_frequency = {
    path = [pkgs.intel-gpu-tools];
    script = "intel_gpu_frequency -m";
    wantedBy = ["multi-user.target"];
  };

  workstation = {
    modules.zfs.enable = true;

    desktops.hyprland.enable = true;
  };

  nix.gc.automatic = false;
}
