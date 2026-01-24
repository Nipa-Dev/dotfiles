{ ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --group-directories-first";
      dir = "eza --group-directories-first";
      ll = "eza -l --group-directories-first";
      la = "eza -lA --group-directories-first";
      tree = "eza --tree --group-directories-first";
      cat = "bat";
      grep = "ugrep";
      cls = "clear";
      "..." = "../../";
    };
    interactiveShellInit = ''
      set fish_greeting
      if set -q DISTROBOX_ENTER_PATH
          set -gx PATH /home/nipa/.local/bin /home/nipa/.nix-profile/bin /usr/local/sbin/ /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /run/current-system/sw/bin
      end
    '';
  };
}
