{
  caches.ErrorNoBinaries.external = false;

  services.logind.lidSwitch = "ignore";
  shared.modules = {
    btrfs.compression.subvolumeLayout = false;
    wireless.enable = true;
  };
  server.modules = {
    bootloader.enable = true;

    servers.minecraft.enable = true;
  };
}
