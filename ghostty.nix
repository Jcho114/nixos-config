{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
  };

  home.file."./.config/ghostty/config".text = ''
    command = zsh --login
    font-size = 12
    font-family = JetBrains Mono
    background-opacity = 0.95
    background-blur-radius = 20
    window-width = 140
    window-height = 40
    window-padding-x = 6
    window-padding-y = 6
  '';
}
