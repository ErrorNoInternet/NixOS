{inputs, ...}: {
  environment.sessionVariables.HOSTNAME = "ErrorNoPhone";

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    sharedModules = [
      ../../home/hosts/ErrorNoPhone.nix
    ];
  };
}
