{ pkgs, ... }:

let
  jdkWithFX = pkgs.openjdk21.override {
    enableJavaFX = true;
  };
in
{
  home.packages = with pkgs; [
    (pkgs.rstudioWrapper.override {
      packages = with pkgs.rPackages; [
        ggplot2
        dplyr
        xts
      ];
    })
    borgbackup
    dbeaver-bin
    eza
    ffmpeg
    foliate
    fzf
    grim
    jdkWithFX
    jetbrains.idea
    libreoffice-qt6-fresh
    localsend
    loupe
    lua-language-server
    maven
    mpv
    mysql-workbench
    mysql84
    nodejs
    obsidian
    onedrive
    onlyoffice-desktopeditors
    openbox
    pandoc
    pnpm
    python3
    rclone
    ruff
    spotify
    sqlite
    swww
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
