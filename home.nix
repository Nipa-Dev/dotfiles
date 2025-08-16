{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      bat
      wofi
    ];

    # This needs to actually be set to your username
    username = "nipa";
    homeDirectory = "/home/nipa";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "25.05";
  };
}
