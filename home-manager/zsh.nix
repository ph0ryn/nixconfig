{ ... }:
{
  programs.zsh = {
    enable = true;
  };

  home.file.".config/zsh/functions".source = ./functions;
}
