let
    NixBtw = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDzdpxex2GlFVf5G2qsh3Ixa/XCMjnbq4JSTmAev7WYJ";
    Crix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8EVE+n6AqS8NWfZRjqLSI3HY+2YEWEsDo9oPSMt5C+";
    systems = [ NixBtw Crix ];
in
{
    "nheko-access-token.age".publicKeys = [ NixBtw ];
    "wireless-networks.age".publicKeys = systems;
}
