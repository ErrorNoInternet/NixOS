{
  self,
  host,
  git,
  ...
}:
self.lib.derivations.c.optimizeAllExceptLto host git
