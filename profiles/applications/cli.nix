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
      tourenbuchctl
      texlive.combined.scheme-full
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
