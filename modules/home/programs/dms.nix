{ pkgs, ... }: {
  programs.dank-material-shell = {
    enable = true;
    enableSystemMonitoring = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
  };
}
