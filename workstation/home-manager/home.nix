{ config, pkgs, secrets, ... }:

let
    hostName = builtins.getEnv "HOSTNAME";
    secrets = import ./secrets/secrets.nix;
in
{
    imports = [
        (import "/home/ryan/.config/home-manager/hosts/${hostName}.nix" { inherit config pkgs secrets; })
    ];
}
