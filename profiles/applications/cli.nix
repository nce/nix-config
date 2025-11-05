{
  pkgs,
  lib,
  ...
}:
with lib;

{
  home = {
    packages = with pkgs; [
      gnuplot
      qrencode
      ghostscript
      tourenbuchctl
      texlive.combined.scheme-full
      pwgen
      qmk
      teensy-loader-cli
      lazygit
      restic
      go-task
      (aspellWithDicts (
        dicts: with dicts; [
          en
          de
        ]
      ))
    ];
  };

  programs = {
    zsh = {
      shellAliases = {
        tb = "tourenbuchctl";
      };
    };

    pandoc = {
      enable = true;
    };

  };

}
