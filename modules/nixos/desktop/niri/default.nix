{ nixosModules, pkgs, niriPackage, ... }:

{
  imports = [
    "${nixosModules}/desktop/wayland-common"
  ];

  programs.niri = {
    enable = true;
    package = niriPackage;
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
