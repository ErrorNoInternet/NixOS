{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    devShells.sandbox = pkgs.mkShell {
      name = "sandbox";

      packages = with pkgs; let
        mkNixPak = inputs.nixpak.lib.nixpak {inherit lib pkgs;};
      in [
        ((mkNixPak {
            config = _: {
              app.package = bash;

              dbus.enable = false;
              etc.sslCertificates.enable = true;
            };
          })
          .config
          .script)

        croc
        curl
        git
        which
      ];

      shellHook = "exec bash";
    };
  };
}
