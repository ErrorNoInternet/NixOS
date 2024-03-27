{
  services.logind.lidSwitch = "ignore";

  shared.wireless.enable = true;

  server = {
    bootloader.enable = true;

    services.minecraft.enable = true;
  };
}
