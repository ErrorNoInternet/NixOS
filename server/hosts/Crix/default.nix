{
  host.id = "b5d99878";

  services.logind.lidSwitch = "ignore";

  shared.wireless.enable = true;

  server = {
    bootloader.enable = true;

    services.minecraft.enable = true;
  };
}
