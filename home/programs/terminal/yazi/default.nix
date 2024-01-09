{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./keymaps.nix
    ./open.nix
    ./ui.nix
  ];

  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.yazi;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };
}
