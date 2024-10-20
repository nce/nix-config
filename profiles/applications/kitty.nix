{
  programs = {
    kitty = {
      enable = true;
      font = {
        name = "FiraCode Nerd Font";
        size = 18;
      };

      shellIntegration.enableZshIntegration = false;

      themeFile = "ayu_mirage";

      settings = {
        background_opacity = 0.9;
        enable_audio_bell = "no";
      };
    };
  };

}
