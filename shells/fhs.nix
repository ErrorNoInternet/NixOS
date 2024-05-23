{
  perSystem = {pkgs, ...}: {
    devShells.fhs =
      (pkgs.buildFHSEnv {
        name = "fhs";
      })
      .env;
  };
}
