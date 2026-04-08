{
  self,
  config,
  pkgs,
  ...
}:
{
  system = {
    stateVersion = 6;
    primaryUser = "ph0ryn";
    configurationRevision = self.rev or self.dirtyRev or null;
  };
  nix.enable = false;
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.ph0ryn.home = "/Users/ph0ryn";

  security.pam.services.sudo_local.touchIdAuth = true;

  programs.zsh.enable = true;

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
