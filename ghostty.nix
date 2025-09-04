{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
  };

  home.file."./.config/ghostty/config".text = ''
    command = zsh --login
  '';
}
