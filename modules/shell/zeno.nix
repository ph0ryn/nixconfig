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
  home.file.".zsh/plugins/zeno" = {
    source = zenoSource;
    recursive = true;
  };

  xdg.configFile."zeno" = {
    source = ./zeno;
    recursive = true;
  };

  programs = {
    zsh = {
      initContent = ''
        export ZENO_ROOT="${zenoHome}"
        source "${zenoHome}/zeno-bootstrap.zsh"
        zeno-bind-default-keys --lazy
        zsh-defer zeno-preload
      '';
    };
  };
}
