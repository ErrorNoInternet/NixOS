{
  config,
  inputs',
  inputs,
  osConfig ? {},
  self,
  system,
  ...
}: {
  nixpkgs.overlays = [
    (_: _: (import "${self}/packages" {
      pkgs = import inputs.nixpkgs {inherit system;};
      inherit inputs' self system;
      config.host =
        config.host
        or osConfig.host
        or config.osConfig.host;
    }))
  ];
}
