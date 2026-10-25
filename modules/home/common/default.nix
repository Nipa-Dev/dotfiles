{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../programs/dms.nix
    ../programs/fastfetch.nix
    ../programs/fish.nix
    ../programs/gtk.nix
    ../programs/niri.nix
    ../programs/obs.nix
    ../programs/packages.nix
    ../programs/spotify.nix
    ../programs/starship.nix
    ../programs/vscode.nix
    ../programs/waybar.nix
    ../programs/xdg.nix
    ../programs/zen-browser.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs = {
    bat.enable = true;
    btop.enable = true;
  };
}
