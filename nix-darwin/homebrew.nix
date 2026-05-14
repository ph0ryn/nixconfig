{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = false;
      cleanup = "none";
    };

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
  };
}
