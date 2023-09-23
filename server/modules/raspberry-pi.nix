{ config, pkgs, ... }:

{
    boot.loader = {
        grub.enable = false;
        generic-extlinux-compatible.enable = true;
    };
    environment.systemPackages = [ pkgs.libraspberrypi ];
}
