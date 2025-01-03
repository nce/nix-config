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
      tourenbuchctl
      texlive.combined.scheme-full
      pwgen
      qmk
      teensy-loader-cli
      lazygit
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
