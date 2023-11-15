{ pkgs, ... }:

{
  home.packages = [ pkgs.virt-manager ];
  dconf.settings = {
    "org/virt-manager/virt-manager" = {
      xmleditor-enabled = true;
    };
    "org/virt-manager/virt-manager/confirm" = {
      forcepoweroff = true;
      poweroff = true;
    };
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
    "org/virt-manager/virt-manager/console" = {
      auto-redirect = false;
      resize-guest = 1;
    };
    "org/virt-manager/virt-manager/details" = {
      show-toolbar = false;
    };
    "org/virt-manager/virt-manager/stats" = {
      enable-disk-poll = true;
      enable-memory-poll = true;
      enable-net-poll = true;
    };
    "org/virt-manager/virt-manager/vmlist-fields" = {
      disk-usage = true;
      memory-usage = true;
      network-traffic = true;
    };
  };
}
