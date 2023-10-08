{ pkgs }:

{
    networking.hostName = "Crix";
    environment.variables.HOSTNAME = "Crix";

    services.logind.lidSwitch = "ignore";
}
