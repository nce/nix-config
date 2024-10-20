{
  imports = [
    ./fonts.nix
    ./macos.nix
    ./packages.nix
    ./time.nix
    ./brews.nix
  ];

  config = {
    home-manager = {
      backupFileExtension = "backup";
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };

}
