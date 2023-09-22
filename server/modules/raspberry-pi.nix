{ config, pkgs, ... }:

{
    boot = {
        loader = {
            grub.enable = false;
            generic-extlinux-compatibile.enable = true;
        };
    };
}
