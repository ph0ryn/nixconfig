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
      {
        name = "node";
        link = false;
      }
      "python@3.14"
    ];

    casks = [
      "android-commandlinetools"
      "azookey"
      "discord"
      "finetune"
      "ghostty@tip"
      "google-chrome"
      "lm-studio"
      "macpacker"
      "omniwm"
      "orbstack"
      "reqable"
      "slack"
    ];
  };
}
