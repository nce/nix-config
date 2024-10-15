{
  imports = [
    ./fonts.nix
    ./macos.nix
    ./packages.nix
    ./time.nix
  ];

  config = {
    home-manager = {
      backupFileExtension = "backup";
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };

}
