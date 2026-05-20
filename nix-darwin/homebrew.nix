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
      "neovim"
      "python@3.14"
    ];

    casks = [
      "azookey"
      "anaconda"
      "cmux"
      "font-plemol-jp-nf"
      "ghostty"
      "macpacker"
      "mitmproxy"
      "reqable"
      "visual-studio-code"
    ];
  };
}
