{ config, pkgs, ... }:

{
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;

      # Explicit associations (lower priority)
      associations.added = {
        "inode/directory" = [ "thunar.desktop" ];

        "audio/mpeg" = [ "mpv.desktop" ];

        "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
        "image/png" = [ "org.gnome.Loupe.desktop" ];

        "video/mp4" = [ "mpv.desktop" ];
        "video/webm" = [ "mpv.desktop" ];
        "video/quicktime" = [ "mpv.desktop" ];
      };

      # Defaults (highest priority)
      defaultApplications = {
        "inode/directory" = [ "thunar.desktop" ];

        "audio/*" = [ "mpv.desktop" ];

        "image/*" = [ "org.gnome.Loupe.desktop" ];

        "video/*" = [ "mpv.desktop" ];

        "application/json" = [ "org.gnome.TextEditor.desktop" ];
        "application/toml" = [ "org.gnome.TextEditor.desktop" ];
      };
    };

    userDirs = {
      enable = true;
      createDirectories = false;
    };
  };
}
