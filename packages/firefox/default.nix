{
  cpus,
  firefox,
  self,
  system,
  ...
}:
self.optimizeNative {inherit cpus system;}
(self.optimizeLto firefox)
