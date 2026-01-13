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
      golangci-lint
      go-critic
      air
      cargo
      coreutils
      nixfmt
    ];
  };

  programs = {
  };
}
