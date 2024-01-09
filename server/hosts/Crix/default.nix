{
  imports = [
    ./hardware.nix

    ../../../shared/modules/wireless.nix
    ../../modules/bootloader.nix
    ../../profiles/minecraft-server.nix
  ];

  networking.hostName = "Crix";
  environment.variables.HOSTNAME = "Crix";

  caches.ErrorNoBinaries.external = false;

  services.logind.lidSwitch = "ignore";
}
