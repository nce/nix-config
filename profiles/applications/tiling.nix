{
  pkgs,
  lib,
  ...
}:
with lib;

{
  home = {
    packages = with pkgs; [
      aerospace
    ];
  };
}