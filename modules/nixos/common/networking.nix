{ ... }:

{
  networking.networkmanager = {
    enable = true;
  };
  networking.networkmanager.wifi.powersave = false;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];
}
