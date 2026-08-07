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
    zsh = {
      plugins = [
        {
          name = "zsh-defer";
          file = "share/zsh-defer/zsh-defer.plugin.zsh";
          src = pkgs.zsh-defer;
        }
      ];
    };
    zoxide.enable = true;
  };

  imports = [
    ./functions
    ./zeno.nix
  ];
}
