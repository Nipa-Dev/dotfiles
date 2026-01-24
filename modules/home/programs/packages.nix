{ pkgs, ... }:
{
  home.packages = with pkgs; [
    borgbackup
    eza
    ugrep
    ffmpeg
    fzf
    foliate
    localsend
    loupe
    libreoffice-qt6-fresh
    mpv
    onedrive
    openjdk21
    obsidian
    python3
    pandoc
    texliveSmall
    uv
    rclone
    swww
    wl-clipboard
    wofi
    nodejs
    unzip

    geany
    

    mysql80
    mysql-workbench
    dbeaver-bin
  ];
}
