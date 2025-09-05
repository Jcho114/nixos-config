{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      set number relativenumber
      set tabstop=2
      set shiftwidth=2
      set expandtab
      set smartindent
    '';
  };
}
