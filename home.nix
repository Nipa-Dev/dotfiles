{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      bat
      wofi
      swww
      wl-clipboard
      jdk25
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

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      yzhang.markdown-all-in-one
      ms-python.python
    ];
  };
}

