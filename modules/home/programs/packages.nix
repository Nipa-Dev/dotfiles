{ pkgs, ... }:

let
    jdkWithFX = pkgs.openjdk21.override {
	enableJavaFX = true;
    };

in
{
  home.packages = with pkgs; [
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
    texliveSmall
    tesseract
    uv
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
    mysql80
    mysql-workbench
    dbeaver-bin
    zellij

    # lsp
    lua-language-server

    # for javaFX dev
    xwayland
    openbox
  ];
}
