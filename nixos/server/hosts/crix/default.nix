{
  services.logind.lidSwitch = "ignore";

  nixos.wireless.enable = true;

  server = {
    bootloader.enable = true;

    services.minecraft.enable = true;
  };
}
