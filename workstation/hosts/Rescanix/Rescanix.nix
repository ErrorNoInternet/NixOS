{ pkgs, ... }:

{
    networking.hostName = "Rescanix";
    environment.variables.HOSTNAME = "Rescanix";

    boot.loader.systemd-boot.memtest86.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;
    environment.systemPackages = with pkgs; [
        (import ../../derivations/collect-hwinfo.nix { inherit pkgs; })
        (import ../../derivations/passgen.nix.nix { inherit pkgs; })
        (import ../../derivations/tbw.nix { inherit pkgs; })
        blender
        brave
        btop
        cpu-x
        cudaPackages.cudatoolkit
        drm_info
        ffmpeg_6-full
        firefox
        geekbench
        intel-gpu-tools
        kdiskmark
        lm_sensors
        lshw
        mangohud
        mesa-demos
        mpv
        nmap
        nvtop
        powertop
        prismlauncher
        radeontop
        smartmontools
        sshfs
        unigine-heaven
        vulkan-tools
    ];
}
