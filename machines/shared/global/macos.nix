{
  pkgs,
  ...
}:
{
  config = {
    system = {

      keyboard = {
        enableKeyMapping = true;
        remapCapsLockToControl = true;
      };

      defaults = {

        NSGlobalDomain = {
          AppleFontSmoothing = 2;
          AppleKeyboardUIMode = 3;
          AppleMeasurementUnits = "Centimeters";
          AppleMetricUnits = 1;
          ApplePressAndHoldEnabled = true;
          AppleShowAllExtensions = true;
          AppleShowScrollBars = "Always";
          AppleTemperatureUnit = "Celsius";
          InitialKeyRepeat = 16;
          KeyRepeat = 2;
          NSAutomaticCapitalizationEnabled = false;
          NSAutomaticDashSubstitutionEnabled = false;
          NSAutomaticPeriodSubstitutionEnabled = false;
          NSAutomaticQuoteSubstitutionEnabled = false;
          NSAutomaticSpellingCorrectionEnabled = false;
          NSDisableAutomaticTermination = false;
          NSDocumentSaveNewDocumentsToCloud = false;
          NSNavPanelExpandedStateForSaveMode = true;
          NSNavPanelExpandedStateForSaveMode2 = true;
          NSScrollAnimationEnabled = false;
          NSTableViewDefaultSizeMode = 2;
          NSTextShowsControlCharacters = true;
          NSUseAnimatedFocusRing = false;
          NSWindowResizeTime = 0.2;
          PMPrintingExpandedStateForPrint = true;
          PMPrintingExpandedStateForPrint2 = true;
          "com.apple.mouse.tapBehavior" = 1;
          "com.apple.swipescrolldirection" = false;

        };

        SoftwareUpdate = {
          AutomaticallyInstallMacOSUpdates = true;
        };

        dock = {
          autohide = true;
          autohide-delay = 0.2;
          mineffect = "scale";
          show-recents = false;
          tilesize = 32;
          largesize = 64;
          magnification = true;

          wvous-tl-corner = 2;
          wvous-bl-corner = 13;
          wvous-tr-corner = 11;
          wvous-br-corner = 4;

          persistent-apps = [
            "${pkgs.mailspring}/Applications/Mailspring.app"
            "/System/Cryptexes/App/System/Applications/Safari.app"
            "/Applications/Brave Browser.app"
            "${pkgs.kitty}/Applications/kitty.app"
            "/System/Applications/Calendar.app"
            "/System/Applications/Messages.app"
            "${pkgs.slack}/Applications/Slack.app"
            "${pkgs.obsidian}/Applications/Obsidian.app"
            "/System/Applications/Music.app"
          ];
        };

        finder = {
          AppleShowAllExtensions = true;
          AppleShowAllFiles = true;
          FXEnableExtensionChangeWarning = false;
          FXPreferredViewStyle = "clmv";
          QuitMenuItem = true;
          _FXShowPosixPathInTitle = false;
          ShowPathbar = true;
          ShowStatusBar = true;
        };

        loginwindow = {
          #DisableConsoleAccess = true;
          GuestEnabled = false;
          LoginwindowText = "Paradise";
          PowerOffDisabledWhileLoggedIn = true;
          RestartDisabledWhileLoggedIn = true;
          ShutDownDisabledWhileLoggedIn = true;
          SHOWFULLNAME = true;
        };

        screencapture = {
          location = "~/Pictures/Screenshots";
        };

        trackpad = {
          ActuationStrength = 1;
          Clicking = true;
          FirstClickThreshold = 1;
          SecondClickThreshold = 1;
          TrackpadRightClick = true;
          TrackpadThreeFingerDrag = false;
        };
      };
    };
  };
}
