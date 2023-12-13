{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "Crix";
  environment.variables.HOSTNAME = "Crix";

  services.logind.lidSwitch = "ignore";
}
