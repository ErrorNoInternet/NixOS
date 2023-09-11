{ config, pkgs, ... }:

let
    hostName = builtins.getEnv "HOSTNAME";
    secrets = import ./secrets/secrets.nix;
in
{
    imports = [
        (import ./hosts/${hostName}.nix { inherit config pkgs secrets; })
    ];
}
