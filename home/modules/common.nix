{ config, pkgs, ... }:
{
  imports = [
    ./fastfetch.nix
    ./fish.nix
    ./starship.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs = {
    bat.enable = true;
    btop.enable = true;
  };
}
