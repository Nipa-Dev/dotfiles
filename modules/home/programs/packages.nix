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
    eza
    ugrep
    ffmpeg
    fzf
    foliate
    jetbrains.idea
    localsend
    loupe
    libreoffice-qt6-fresh
    mpv
    onedrive
    jdkWithFX
    maven
    obsidian
    python3
    pandoc
    spotify
    sqlite
    texliveSmall
    tesseract
    # Temporarily remove uv
    # uv
    ruff
    rclone
    swww
    wl-clipboard
    wofi
    nodejs
    pnpm
    unzip
    zed-editor
    grim
    mysql84
    mysql-workbench
    dbeaver-bin
    zellij
    zip
    onlyoffice-desktopeditors
    # lsp
    lua-language-server

    # for javaFX dev
    xwayland
    openbox
  ];
}
