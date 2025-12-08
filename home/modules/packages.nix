{pkgs, ...}: {
    home.packages = with pkgs; [
        borgbackup
        eza
	ugrep
        ffmpeg
        fzf
	foliate
	localsend
        libreoffice-qt6-fresh
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
