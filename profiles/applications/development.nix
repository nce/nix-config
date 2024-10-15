{
  pkgs,
  lib,
  ...
}:
with lib;

{
  home = {
    packages = with pkgs; [
      go
      cargo
      nixfmt-rfc-style
    ];
  };
}
