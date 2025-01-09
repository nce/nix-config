{
  pkgs,
  lib,
  ...
}:
with lib;

{
  home = {
    packages = with pkgs; [
      mailspring
      slack
      obsidian
      discord
      soundsource
    ];
  };
}
