{
  pkgs,
  lib,
  ...
}:
with lib;

{
  home = {
    packages = with pkgs; [
      obsidian
      discord
      slack
    ];
  };
}
