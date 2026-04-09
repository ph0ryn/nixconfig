{ ... }:
{
  system.defaults = {
    NSGlobalDomain = {
      # mouse / trackpad
      "com.apple.swipescrolldirection" = true;

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
    };

    # Dock
    dock = {
      show-process-indicators = true;
      show-recents = false;
      launchanim = true;
      mineffect = "scale";
    };

    # misc
    CustomUserPreferences = {
      NSGlobalDomain = {
        # keyboard
        WebAutomaticSpellingCorrectionEnabled = false;
        # Finder
        AppleMenuBarVisibleInFullscreen = true;
      };
    };
  };
}
