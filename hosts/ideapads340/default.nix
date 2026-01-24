{ hostname, nixosModules, ... }:

{
  imports = [
    ./hardware-configuration.nix
    "${nixosModules}/common"
    "${nixosModules}/desktop/niri"
  ];

  networking.hostName = hostname;

  system.stateVersion = "25.05";
}
