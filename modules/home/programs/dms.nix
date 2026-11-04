{ inputs, pkgs, ... }:

{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];

  programs.dank-material-shell = {
    enable = true;

    systemd = {
      enable = false;
    };

    niri = {
      enableKeybinds = false;
      enableSpawn = true;
      includes = {
        enable = false;
      };
    };
  };
}
