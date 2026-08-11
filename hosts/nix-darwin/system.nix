{ ... }:
{
  system.defaults = {
    ".GlobalPreferences" = {
      "com.apple.mouse.scaling" = 2.0;
      "com.apple.sound.beep.sound" = "/System/Library/Sounds/Funk.aiff";
    };

    NSGlobalDomain = {
      # mouse / trackpad
      "com.apple.sound.beep.volume" = 1.0;
      "com.apple.swipescrolldirection" = true;

      # Finder / file picker
      AppleShowAllFiles = true;

      # keyboard
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
    };

    # Finder
    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      FXDefaultSearchScope = "SCcf";
      ShowPathbar = true;
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "Nlsv";
      FXRemoveOldTrashItems = true;
      _FXSortFoldersFirst = true;
    };

    # Dock
    dock = {
      show-process-indicators = true;
      show-recents = false;
      launchanim = true;
      mineffect = "scale";
      orientation = "bottom";
      tilesize = 16;
      magnification = true;
      largesize = 32;
      minimize-to-application = true;
      wvous-br-corner = 14;
    };

    screencapture.location = "~/Documents/screenshots";

    WindowManager.EnableTiledWindowMargins = false;

    controlcenter.BatteryShowPercentage = true;

    # misc
    CustomUserPreferences = {
      NSGlobalDomain = {
        # keyboard
        WebAutomaticSpellingCorrectionEnabled = false;
        # Finder
        AppleMenuBarVisibleInFullscreen = true;
      };

      pbs = {
        NSServicesStatus = {
          "com.mitchellh.ghostty - New Ghostty Tab Here - openTab" = {
            key_equivalent = "@.";
          };
        };
      };
    };
  };
}
