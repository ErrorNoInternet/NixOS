{pkgs, ...}: {
  networking.firewall.allowedTCPPorts = [25565];
  environment.systemPackages = with pkgs; [
    jdk17
  ];
}
