let
  systems = {
    Crix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8EVE+n6AqS8NWfZRjqLSI3HY+2YEWEsDo9oPSMt5C+";
    NixBtw = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHwJ6RJApteQw7nKq/dAyUC5gMf+q34bFivpBoE5eOeF";
    Pix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINHoKZCpEfJ+rBCndkSlH3qEMypvSuJRdieSwPVMCKZB";
    Rescanix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFFrZMlFFrKX3yZF70eEHX4RlX8ovcf/g8bPQolOAywK";
  };
  users = {
    NixBtw = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIEi1hNox3FVQ43qxMBNFTUw0guBctlp5DWsD3bD89J2";
  };
  all = {
    systems = builtins.attrValues systems;
    workstations = with systems; [NixBtw Rescanix];
    servers = with systems; [Crix Pix];
  };
in {
  "attic_server-token.age".publicKeys = [users.NixBtw systems.Pix];
  "ddns.age".publicKeys = [users.NixBtw systems.Pix];
  "server-zed.age".publicKeys = all.servers;
  "wireless-networks.age".publicKeys = all.systems;
  "workstation-zed.age".publicKeys = all.workstations;
}
