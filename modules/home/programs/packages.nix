{ pkgs, ... }:
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
    (openjdk21.override { enableJavaFX = true; })
    obsidian
    python3
    pandoc
    spotify
    texliveSmall
    uv
    ruff
    rclone
    swww
    wl-clipboard
    wofi
    nodejs
    unzip
    zed-editor
    grim
    mysql80
    mysql-workbench
    dbeaver-bin

    # for javaFX dev
    xwayland
    openbox
  ];
}
