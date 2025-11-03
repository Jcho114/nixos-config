{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Jcho114";
      user.email = "joseph.cho20@gmail.com";
      init.defaultBranch = "main";
      safe.directory = [
        "/etc/nixos"
      ];
      credential.helper = "${
        pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
    };
  };

}
