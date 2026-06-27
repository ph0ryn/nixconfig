{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = false;
      cleanup = "none";
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
      "cmux"
      "font-plemol-jp-nf"
      "ghostty"
      "macpacker"
      "mitmproxy"
      "raycast"
      "reqable"
      "zed"
      "visual-studio-code"
    ];
  };
}
