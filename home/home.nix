{ lib, pkgs, zen-browser, ... }:
{
  imports = [
    ./modules/common.nix
  ];
  home = {
    packages = with pkgs; [
      wofi
      swww
      wl-clipboard
      jdk24
      borgbackup
      localsend
      eza
    ];

    # This needs to actually be set to your username
    username = "nipa";
    homeDirectory = "/home/nipa";

    sessionVariables = {
	NIXOS_OZONE_WL = "1";
    };

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "25.05";
  };

  programs.zen-browser.enable = true;

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      ms-python.python
    ];
  };
}

