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

      casks = [
        "elgato-camera-hub"
        "elgato-control-center"
        "elgato-stream-deck"
        "bambu-studio"
      ];
    };
  };
}
