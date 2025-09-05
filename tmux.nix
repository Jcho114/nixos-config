{ pkgs, ... }:
{
  programs.tmux = {
   enable = true;
   mouse = true;
   shell = "${pkgs.zsh}/bin/zsh";
  };
}
