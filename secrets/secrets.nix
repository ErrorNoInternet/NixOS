let
    NixBtw = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDzdpxex2GlFVf5G2qsh3Ixa/XCMjnbq4JSTmAev7WYJ";
    Crix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIt0sioZlJqPem8SZfy/zoJGprGLYBFshM71WwQfa4bG";
    systems = [ NixBtw Crix ];
in
{
    "nheko.age".publicKeys = [ NixBtw ];
    "wireless-networks.age".publicKeys = systems;
}
