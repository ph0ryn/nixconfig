{ config, pkgs, ... }:
let
  zenoSource = pkgs.fetchFromGitHub {
    owner = "yuki-yano";
    repo = "zeno.zsh";
    rev = "2e8fbecce0fc3692a5fcc9033ecca7ab35263e56";
    hash = "sha256-05+w1WP/SHKp97JTGsvO3csI123U7py+fVSKnAWiUNY=";
  };
  zenoHome = "${config.home.homeDirectory}/.zsh/plugins/zeno";
in
{
  home.packages = with pkgs; [
    eza
    filetree
    tree
  ];

  home.file.".zsh/plugins/zeno" = {
    source = zenoSource;
    recursive = true;
  };

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

      initContent = ''
        export ZENO_ROOT="${zenoHome}"
        source "${zenoHome}/zeno-bootstrap.zsh"
        zeno-bind-default-keys --lazy
        zsh-defer zeno-preload
      '';
    };
    zoxide.enable = true;
  };
}
