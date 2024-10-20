{
  pkgs,
  lib,
  config,
  options,
  ...
}:
with lib;

{
  config = {

    homebrew = {
      enable = true;

      onActivation = {
        autoUpdate = true;
        upgrade = true;
        cleanup = "zap";
      };

      taps = [

      ];

      casks = [
        "macpass"
        "brave-browser"
        "tunnelblick"
        "keybase"
        "moneymoney"
      ];
    };
  };
}
