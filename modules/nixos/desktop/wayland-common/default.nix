{ pkgs, ... }:

{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
    config.common.default = "gtk";
  };

  environment.systemPackages = with pkgs; [
    fuzzel
    waybar
    mako
    alacritty
    swaylock
    greetd.tuigreet
    adwaita-icon-theme
  ];
}
