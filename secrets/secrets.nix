let
  systems = {
    Crix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8EVE+n6AqS8NWfZRjqLSI3HY+2YEWEsDo9oPSMt5C+";
    NixBtw = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHwJ6RJApteQw7nKq/dAyUC5gMf+q34bFivpBoE5eOeF";
    Pix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINHoKZCpEfJ+rBCndkSlH3qEMypvSuJRdieSwPVMCKZB";
  };
  users = {
    NixBtw = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIEi1hNox3FVQ43qxMBNFTUw0guBctlp5DWsD3bD89J2";
  };
  all = (builtins.attrValues systems) ++ (builtins.attrValues users);
in {
  "attic_server-token.age".publicKeys = [users.NixBtw systems.Pix];
  "ddns.age".publicKeys = [users.NixBtw systems.Pix];
  "nheko_access-token.age".publicKeys = [users.NixBtw];
  "wireless-networks.age".publicKeys = all;
  "workstation-zed.age".publicKeys = [systems.NixBtw];
}
