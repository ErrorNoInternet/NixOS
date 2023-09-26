let
    NixBtw-user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDzdpxex2GlFVf5G2qsh3Ixa/XCMjnbq4JSTmAev7WYJ";
    Crix-system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8EVE+n6AqS8NWfZRjqLSI3HY+2YEWEsDo9oPSMt5C+";
    Pix-system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINHoKZCpEfJ+rBCndkSlH3qEMypvSuJRdieSwPVMCKZB";
    systems = [ NixBtw-user Crix-system Pix-system ];
in
{
    "ddns.age".publicKeys = [ NixBtw-user Pix-system ];
    "nheko-access-token.age".publicKeys = [ NixBtw-user ];
    "wireless-networks.age".publicKeys = systems;
}
