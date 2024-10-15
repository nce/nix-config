{
  pkgs,
  lib,
  ...
}:
with lib;

{
  home = {
    packages = with pkgs; [
      pre-commit
      gnupg
    ];
  };

  programs = {
    git = {
      enable = true;
      delta.enable = true;

      userEmail = "git@nce.wtf";
      userName = "Ulli Goschler";

      signing.signByDefault = true;

      signing.key = "~/.ssh/git_ed25519.pub";

      extraConfig = {
        gpg = {
          format = "ssh";
        };

        format = {
          signoff = true;
        };

        credential = {
          helper = "osxkeychain";
        };

        merge = {
          conflictstyle = "diff3";
        };
      };
    };
  };
}