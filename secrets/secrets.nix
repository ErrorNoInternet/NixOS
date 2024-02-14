let
  users = {
    NixBtw = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIEi1hNox3FVQ43qxMBNFTUw0guBctlp5DWsD3bD89J2";
  };
  systems = {
    Crix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8EVE+n6AqS8NWfZRjqLSI3HY+2YEWEsDo9oPSMt5C+";
    Pix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINHoKZCpEfJ+rBCndkSlH3qEMypvSuJRdieSwPVMCKZB";
  };
  all = [users.NixBtw systems.Crix systems.Pix];
in {
  "attic_server-token.age".publicKeys = [users.NixBtw systems.Pix];
  "ddns.age".publicKeys = [users.NixBtw systems.Pix];
  "nheko_access-token.age".publicKeys = [users.NixBtw];
  "wireless-networks.age".publicKeys = all;
}
