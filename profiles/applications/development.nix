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
      cargo
      nixfmt-rfc-style
      coreutils
    ];
  };

  programs =
    {
    };
}
