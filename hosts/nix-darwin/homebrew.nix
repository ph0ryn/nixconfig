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
      "jadx"
      "node@26"
      "python@3.14"
    ];

    casks = [
      "android-commandlinetools"
      "azookey"
      "ghostty@tip"
      "macpacker"
      "mitmproxy"
      "orbstack"
      "raycast"
      "reqable"
      "zed"
    ];
  };
}
