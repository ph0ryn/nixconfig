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
      "python@3.14"
    ];

    masApps = {
      Amphetamine = 937984704;
    };

    casks = [
      "anaconda"
      "ghostty"
      "macpacker"
      "mitmproxy"
      "reqable"
      "visual-studio-code"
      "font-plemol-jp-nf"
    ];
  };
}
