{
  pkgs,
  lib,
  ...
}:
with lib;

{
  home = {
    packages = with pkgs; [
      slack
      obsidian
      discord
      soundsource
    ];
  };
}
