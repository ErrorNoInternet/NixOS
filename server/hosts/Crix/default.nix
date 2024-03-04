{
  services.logind.lidSwitch = "ignore";

  shared.modules.wireless.enable = true;

  server = {
    bootloader.enable = true;

    services.minecraft.enable = true;
  };
}
