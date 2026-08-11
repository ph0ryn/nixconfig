{ ... }:
{
  homebrew = {
    enable = true;
    enableZshIntegration = false;

    onActivation = {
      autoUpdate = true;
      upgrade = false;
      cleanup = "zap";
    };

    caskArgs = {
      appdir = "/Applications";
    };

    brews = [
      "duti"
      "python@3.14"
    ];

    casks = [
      "android-commandlinetools"
      "azookey"
      "discord"
      "ghostty@tip"
      "google-chrome"
      "lm-studio"
      "macpacker"
      "orbstack"
      "raycast"
      "reqable"
      "slack"
    ];
  };
}
