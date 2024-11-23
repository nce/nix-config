{
  pkgs,
  lib,
  ...
}:
with lib;

{
  home = {
    packages = with pkgs; [
      awscli2
      oci-cli
      aws-vault
      terraform
    ];
  };
}
