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

            bubblewrap.bind = {
              ro = ["/tmp/sandbox/ro"];
              rw = ["/tmp/sandbox/rw"];
            };
          };
        })
        .config
        .script

        croc
        curl
        git
        strace
        which
      ];

      shellHook = "exec bash";
    };
  };
}
