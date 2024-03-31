{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    devShells.sandbox = pkgs.mkShell {
      name = "sandbox";

      packages = with pkgs; let
        mkNixPak = inputs.nixpak.lib.nixpak {inherit lib pkgs;};
      in [
        (mkNixPak {
          config = _: {
            app.package = bash;
            bubblewrap.bind.ro = let
              paths = [
                "curl"
                "which"
              ];
            in
              map (path: "/run/current-system/sw/bin/${path}") paths;

            etc.sslCertificates.enable = true;
            dbus.enable = false;
          };
        })
        .config
        .script
      ];

      shellHook = ''
        which bash
        exec bash
      '';
    };
  };
}
