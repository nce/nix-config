{
  pkgs,
  lib,
  config,
  options,
  ...
}@args:
with lib;

{
  config = {
    nix-homebrew = {
      # Install Homebrew under the default prefix
      enable = true;

      # User owning the Homebrew prefix
      user = "${args.specialArgs.username}";

      mutableTaps = true;
    };

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
