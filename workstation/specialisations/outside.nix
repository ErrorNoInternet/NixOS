{self, ...}: {
  specialisation.outside = self.lib.systems.mkSpecialisation "outside" {
    caches.errornobinaries = {
      internal = false;
      external = true;
    };
  };
}
