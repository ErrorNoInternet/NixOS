let
    NixBtw = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDzdpxex2GlFVf5G2qsh3Ixa/XCMjnbq4JSTmAev7WYJ";
    systems = [ NixBtw ];
in
{
    "nheko.age".publicKeys = systems;
}
