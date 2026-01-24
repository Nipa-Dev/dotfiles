{ pkgs, ... }:

{
  # PipeWire / sound stack (already in your config)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # XDG portals (already in your config)
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
    config.common.default = "gtk";
  };

  # Shared Wayland programs (already in your config)
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
