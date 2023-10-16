{
  environment.sessionVariables.HOSTNAME = "ErrorNoPhone";
  home-manager.sharedModules = [
    ../../home-manager/hosts/ErrorNoPhone.nix
  ];
}
