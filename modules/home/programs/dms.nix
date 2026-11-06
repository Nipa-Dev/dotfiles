{ inputs, pkgs, ... }:

{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];

  programs.dank-material-shell = {
    enable = true;

    systemd = {
      enable = true;
    };

    niri = {
      enableKeybinds = false;
      enableSpawn = false;
      includes = {
        enable = false;
      };
    };
  };
}
