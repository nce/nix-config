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
