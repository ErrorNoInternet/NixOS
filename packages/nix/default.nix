{inputs', ...}:
inputs'.nix-super.packages.default.overrideAttrs {
  doInstallCheck = false;
}
