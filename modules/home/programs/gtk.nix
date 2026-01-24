{
  pkgs,
  ...
}:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Tela-circle-dark";
      package = pkgs.tela-circle-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;

      bookmarks = [
        "file:///home/nipa/Documents"
        "file:///home/nipa/Downloads"
        "file:///home/nipa/Pictures"
        "file:///home/nipa/Videos"
      ];
    };
  };

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };
}
