{
  systemd.services.libvirtd = {
    restartIfChanged = false;
    serviceConfig = {
      Type = "notify";
      KillMode = "process";
      Restart = "no";
    };
  };
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
  users.users.ryan.extraGroups = ["libvirtd"];
}
