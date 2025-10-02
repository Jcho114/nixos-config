{ pkgs, ... }:
{
  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };

        vimAlias = true;
        viAlias = false;

        lsp = {
          enable = true;
          servers = {
            clangd.enable = true;
            nixd.enable = true;
            tinymist.enable = true;
          };
        };

        treesitter = {
          enable = true;
          grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
            c
            nix
          ];
          addDefaultGrammars = true;
          highlight.enable = true;
        };

        telescope.enable = true;

        autocomplete.nvim-cmp.enable = true;
        autopairs.nvim-autopairs.enable = true;

        options = {
          number = true;
          relativenumber = true;
          tabstop = 2;
          shiftwidth = 2;
          expandtab = true;
          smartindent = true;
        };
      };
    };
  };
}
