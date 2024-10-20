{
  imports = [
    ../shared/global
    ./brews
  ];

  networking = {
    localHostName = "mbair22";
    hostName = "mbair22";
    computerName = "mbair22";
  };

  system = {
    stateVersion = 5;
  };
}
