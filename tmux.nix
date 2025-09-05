{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-ghostty";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      {
        plugin = dracula;
        extraConfig = ''
          set -g @dracula-show-battery false
          set -g @dracula-show-powerline true
          set -g @dracula-refresh-rate 10
        '';
      }
    ];
  };
}
