{
  config,
  lib,
  ...
}: {
  options.caches.yazi.enable = lib.mkEnableOption "" // {default = true;};

  config = lib.mkIf config.caches.yazi.enable {
    nix.settings = {
      substituters = ["https://yazi.cachix.org"];
      trusted-public-keys = ["yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="];
    };
  };
}
