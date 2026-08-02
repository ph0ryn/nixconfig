{ pkgs, ... }:
{
  home.packages = with pkgs; [
    eza
    filetree
    tree
  ];

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "TwoDark";
      };
    };
    fzf.enable = true;
    ripgrep.enable = true;
    zoxide.enable = true;
  };
}
