{ pkgs, ... }:

{
  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    inter
  ];

  # Core packages
  environment.systemPackages = with pkgs; [
    android-studio
    brightnessctl
    clang
    gcc
    git
    home-manager
    neovim
    podman-compose
    podman-tui
    upower
    wev
    wget
  ];

  # Environment variables
  environment.variables = {
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
  };
}
