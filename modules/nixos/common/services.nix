{ pkgs, ... }:

{
  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Base programs / services
  services.avahi = {
    enable = false;
    nssmdns4 = false;
    openFirewall = false;
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.gutenprint ];
  };

  # File manager
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  programs.thunar.plugins = with pkgs; [
    thunar-archive-plugin
    thunar-volman
  ];

  programs.firefox.enable = true;

  # Display Manager
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd niri-session";
    };
  };

  # Database
  services.mysql = {
    enable = false;
    package = pkgs.mysql84;
  };
  systemd.services.mysql.wantedBy = pkgs.lib.mkForce [ ];

  # GPG / SSH Agent
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.gnome.gnome-keyring.enable = true;

  # Containers
  virtualisation.containers.enable = true;
  virtualisation.podman.enable = true;
  virtualisation.podman.defaultNetwork.settings.dns_enabled = true;
  virtualisation.podman.dockerCompat = true;

  # Power Management
  services.upower.enable = true;
}
