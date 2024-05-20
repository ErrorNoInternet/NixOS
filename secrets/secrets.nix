let
  systems = {
    crix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8EVE+n6AqS8NWfZRjqLSI3HY+2YEWEsDo9oPSMt5C+";
    msix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHwJ6RJApteQw7nKq/dAyUC5gMf+q34bFivpBoE5eOeF";
    pix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINHoKZCpEfJ+rBCndkSlH3qEMypvSuJRdieSwPVMCKZB";
    rescanix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIswvEJXB3eQVkLGCFj33Pi0sO0jrS8P0WbntH5DBBGf";
  };
  users = {
    msix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIEi1hNox3FVQ43qxMBNFTUw0guBctlp5DWsD3bD89J2";
  };
  all = {
    systems = builtins.attrValues systems;
    workstations = with systems; [msix rescanix];
    servers = with systems; [crix pix];
  };
in {
  "atticd_token.age".publicKeys = [users.msix systems.pix];
  "ddns.age".publicKeys = [users.msix systems.pix];
  "wireless-networks.age".publicKeys = all.systems;
  "zed_server.age".publicKeys = all.servers;
  "zed_workstation.age".publicKeys = all.workstations;
}
