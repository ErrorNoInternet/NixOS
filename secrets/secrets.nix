let
  users = {
    NixBtw = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDzdpxex2GlFVf5G2qsh3Ixa/XCMjnbq4JSTmAev7WYJ";
  };
  systems = {
    Crix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8EVE+n6AqS8NWfZRjqLSI3HY+2YEWEsDo9oPSMt5C+";
    Pix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINHoKZCpEfJ+rBCndkSlH3qEMypvSuJRdieSwPVMCKZB";
  };
  all = [
    users.NixBtw
    systems.Crix
    systems.Pix
  ];
in {
  "attic-server-token.age".publicKeys = [systems.Pix];
  "ddns.age".publicKeys = [users.NixBtw systems.Pix];
  "nheko-access-token.age".publicKeys = [users.NixBtw];
  "wireless-networks.age".publicKeys = all;
}
