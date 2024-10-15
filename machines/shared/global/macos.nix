{
  config = {
    system = {
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
        };

        finder = {
          AppleShowAllExtensions = true;
          FXEnableExtensionChangeWarning = false;
          QuitMenuItem = true;
          _FXShowPosixPathInTitle = true;
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

      };
    };
  };
}
