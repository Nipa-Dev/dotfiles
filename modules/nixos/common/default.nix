{
  config,
  pkgs,
  userConfig,
  inputs,
  ...
}:

{
  imports = [
    ./networking.nix
    ./services.nix
    ./packages.nix
  ];

  # Nix settings
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.substituters = [
    "https://niri.cachix.org"
  ];
  nix.settings.trusted-public-keys = [
    "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
  ];

  security.pki.caCertificateBlacklist = [
    "Comodo AAA Services root"
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # zram config
  zramSwap.enable = true;

  # Timezone & locale
  time.timeZone = "Europe/Helsinki";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_IDENTIFICATION = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_NAME = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };

  # Input / Keyboard
  services.xserver.xkb.layout = "fi";
  console.keyMap = "fi";

  # User account
  users.users.${userConfig.name} = {
    isNormalUser = true;
    description = userConfig.fullName;
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "video"
    ];
  };
  systemd.user.services.niri-flake-polkit.enable = false;
  programs.nix-ld.enable = true;
}
