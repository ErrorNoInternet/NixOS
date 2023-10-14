{
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
  users.users.ryan.extraGroups = [ "libvirtd" ];
}
