{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      cd = "z";
    };
    oh-my-zsh.enable = true;
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = builtins.toString ./.;
        file = "p10k.zsh";
      }
    ];
  };
}
