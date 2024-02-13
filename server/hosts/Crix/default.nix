{
  services.logind.lidSwitch = "ignore";
  shared.modules = {
    btrfs.compression.subvolumeLayout = false;
    wireless.enable = true;
  };
  server = {
    bootloader.enable = true;

    servers.minecraft.enable = true;
  };
}
