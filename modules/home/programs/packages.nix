{ pkgs, ... }:

let
  jdkWithFX = pkgs.openjdk21.override {
    enableJavaFX = true;
  };
in
{
  home.packages = with pkgs; [
    #  packages = with pkgs.rPackages; [
    #    ggplot2
    #    dplyr
    #    xts
    #  ];
    #})
    borgbackup
    dbeaver-bin
    eza
    ffmpeg
    foliate
    fzf
    grim
    jetbrains.idea
    libreoffice-qt6-fresh
    localsend
    loupe
    lua-language-server
    maven
    mpv
    mysql-workbench
    mysql84
    nodejs_26
    obsidian
    onedrive
    onlyoffice-desktopeditors
    openbox
    openjdk25
    pandoc
    pnpm
    python3
    rclone
    ruff
    spotify
    sqlite
    awww
    tesseract
    texliveSmall
    ugrep
    unzip
    wl-clipboard
    wofi
    xwayland
    zed-editor
    zellij
    zip
  ];
}
