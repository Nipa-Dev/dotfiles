{ config, pkgs, ... }:
{
  imports = [
    ../programs/niri.nix
    ../programs/vscode.nix
    ../programs/zen-browser.nix
    ../programs/fish.nix
    ../programs/starship.nix
    ../programs/spotify.nix
    ../programs/packages.nix
    ../programs/xdg.nix
    ../programs/obs.nix
    ../programs/gtk.nix
    ../programs/waybar.nix
    ../programs/fastfetch.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs = {
    bat.enable = true;
    btop.enable = true;
  };
}
