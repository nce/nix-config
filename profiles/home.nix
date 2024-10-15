{
  imports = [
    ./applications
  ];

  home = {
    sessionPath = [ "$HOME/.local/bin" ];

    sessionVariables = {
      LC_ALL = "en_US.UTF-8";
    };

    stateVersion = "24.05";
  };
}
