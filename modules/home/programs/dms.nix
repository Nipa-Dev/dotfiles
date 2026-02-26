{ pkgs, inputs, dgop, ... }:{
  programs.dank-material-shell = {
    enable = true;
    enableSystemMonitoring = true; # enables dgop

    dgop.package = dgop.packages.${pkgs.system}.default;
    systemd.enable = true;
  };
}
