{
  imports = [
    ../shared/global
    ./brews
  ];

  networking = {
    localHostName = "macmini24";
    hostName = "macmini24";
    computerName = "macmini24";
  };

  system = {
    stateVersion = 5;
  };
}
