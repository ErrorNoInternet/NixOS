{ inputs' }:
inputs'.nix-super.packages.default.overrideAttrs (_: {
  doInstallCheck = false;
})
