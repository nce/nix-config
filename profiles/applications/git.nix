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

      settings = {
        user = {
          email = "git@nce.wtf";
          name = "Ulli Goschler";
          signingkey = "~/.ssh/git_ed25519.pub";
        };

        delta.enable = true;

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

          push = {
            default = "current";
            autoSetupRemote = true;
          };

          branch = {
            autosetuprebase = "always";
          };
        };

      };

      signing.signByDefault = true;

      ignores = [
        ".DS_Store"
        "*.out"
        "Session.vim"
        "Sessionx.vim"
        "[._]*.s[a-v][a-z]"
        ".Spotlight-V100"
        "._*"
      ];
    };
  };
}
