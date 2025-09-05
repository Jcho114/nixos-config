{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    extraConfig = {
      user.name = "Jcho114";
      user.email = "joseph.cho20@gmail.com";
      init.defaultBranch = "main";
      safe.directory = [
        "/etc/nixos"
      ];
    };
  };

}
