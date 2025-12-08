{pkgs, ...}: {
    home.packages = with pkgs; [
        borgbackup
        eza
	ugrep
        ffmpeg
        localsend
        mpv
        onedrive
        openjdk21
        obsidian
        python3
	uv
        rclone
        swww
        wl-clipboard
        wofi
    ];
}
