{
  config,
  self,
  ...
}: {
  specialisation.outside = let
    caches.errornobinaries = {
      internal = false;
      external = true;
    };
  in
    self.lib.nixos.mkSpecialisation "outside" {
      inherit caches;
      home-manager.users.${config.username} = {inherit caches;};
    };
}
