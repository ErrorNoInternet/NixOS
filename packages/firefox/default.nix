{
  cpus ? {x86_64-linux = "haswell";},
  firefox,
  self,
  system,
}:
self.optimizeNative {inherit cpus system;}
(self.optimizeLto firefox)
