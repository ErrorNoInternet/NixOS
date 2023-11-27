{inputs, ...}: {
  environment.sessionVariables.HOSTNAME = "ErrorNoPhone";
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    sharedModules = [
      ../../home-manager/hosts/ErrorNoPhone.nix
    ];
  };
}
