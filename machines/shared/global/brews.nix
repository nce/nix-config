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
        autoUpdate = false;
        upgrade = true;
        cleanup = "zap";
      };

      taps = [

      ];

      casks = [
        "macpass"
        "tunnelblick"
        "keybase"
        "moneymoney"
        "citrix-workspace"
        "bambu-studio"
        "ghostty"
      ];

      masApps = {
        Spark = 1176895641;
      };
    };
  };
}
