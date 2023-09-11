{ pkgs, ... }:

{
    imports = [
        (import ../presets/openrgb.nix { inherit pkgs; })
        ../presets/bluetooth.nix
        ../presets/gaming.nix
        ../presets/nvidia.nix
        ../presets/virtualization.nix
    ];

    fileSystems."/mnt/data" = {
        device = "/dev/disk/by-uuid/ffabee31-a399-41ac-b803-d07215f60c33";
        fsType = "auto";
        options = [ "defaults" "nofail" ];
    };
    fileSystems."/mnt/pi-drive1" = {
        device = "192.168.0.100:/mnt/drive1";
        fsType = "nfs";
        options = [ "x-systemd.automount" "noauto" ];
    };
    fileSystems."/mnt/pi-drive3" = {
        device = "192.168.0.100:/mnt/drive3";
        fsType = "nfs";
        options = [ "x-systemd.automount" "noauto" ];
    };

    boot.kernelModules = [ "i2c-dev" "i2c-piix4" ];
    hardware.nvidia = {
        modesetting.enable = true;
        prime = {
            offload = {
                enable = true;
                enableOffloadCmd = true;
            };

            intelBusId = "PCI:0:2:0";
            nvidiaBusId = "PCI:1:0:0";
        };
    };
    services.udev.extraRules = ''
        SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1770", ATTRS{idProduct}=="ff00", TAG+="uaccess", TAG+="MSI_3Zone_Laptop"
    '';

    systemd.services.lock_intel_gpu_frequency = {
        path = with pkgs; [
            intel-gpu-tools
        ];
        script = "intel_gpu_frequency -m";
        wantedBy = [ "multi-user.target" ];
    };
}
