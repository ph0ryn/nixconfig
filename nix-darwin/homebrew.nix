{ ... }:
{
  homebrew = {
    enable = true;

    brews = [
      "duti"
      "jadx"
      "python@3.14"
    ];

    casks = [
      "anaconda"
      "ghostty"
      "macpacker"
      "mitmproxy"
      "reqable"
    ];

    onActivation = {
      autoUpdate = true;
      upgrade = false;
      cleanup = "none";
    };
  };
}
