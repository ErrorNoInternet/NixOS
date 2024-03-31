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

            dbus.enable = false;
            etc.sslCertificates.enable = true;
          };
        })
        .config
        .script
      ];

      shellHook = with pkgs; let
        packages = [
          croc
          curl
          git
          which
        ];
        extendedPath =
          lib.strings.concatStringsSep ":"
          (map (package: "${package}/bin") packages);
      in ''
        export PATH=$PATH:${extendedPath}
        exec bash
      '';
    };
  };
}
