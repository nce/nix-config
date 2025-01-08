{
  imports = [
    ../shared/global
    ./brews
  ];

  networking = {
    localHostName = "macMini24";
    hostName = "macMini24";
    computerName = "macMini24";
  };

  system = {
    stateVersion = 5;
  };
}
