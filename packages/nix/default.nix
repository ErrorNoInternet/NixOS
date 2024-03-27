{inputs', ...}:
inputs'.nix-super.packages.default.overrideAttrs {
  doCheck = false;
  doInstallCheck = false;
}
