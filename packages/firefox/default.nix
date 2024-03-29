{
  cpus,
  firefox,
  self,
  system,
  ...
}:
self.lib.derivations.optimizeNative {inherit cpus system;}
(self.lib.derivations.optimizeLto firefox)
