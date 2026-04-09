{ ... }:
{
  programs.zsh = {
    enable = true;
    envExtra = builtins.readFile ./.zshenv;
    profileExtra = builtins.readFile ./.zprofile;
    initContent = builtins.readFile ./.zshrc;
  };
}
