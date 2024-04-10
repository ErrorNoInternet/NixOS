{
  git,
  host,
  self,
  ...
}:
self.lib.derivations.c.optimizeAllExceptLto host git
