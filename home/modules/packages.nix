{pkgs, ...}: {
    home.packages = with pkgs; [
        borgbackup
        eza
        ffmpeg
        localsend
        mpv
        onedriver
        openjdk21
        obsidian
        python3
        rclone
        swww
        wl-clipboard
        wofi
    ];
}