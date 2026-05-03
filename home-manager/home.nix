{ config, pkgs, ... }:
{
  home.username = "ph0ryn";
  home.homeDirectory = "/Users/ph0ryn";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  imports = [
  ];

  home.packages = with pkgs; [
    # core
    git
    chezmoi

    # package manager
    nodejs_24 # for npm
    pnpm
    uv

    # runtime
    bun
    python315

    # linter & formatter
    nixfmt
    treefmt
    swiftlint
    swiftformat

    # cli utils
    ni
    tree
    gh
    git-filter-repo
    ghq
    fzf
    bat
    ripgrep

    # function
    gnupg
    pinentry-tty
    openssl
    protobuf
    rustup
    llama-cpp
    ffmpeg
    pre-commit

    # mongodb
    mongodb-ce
    mongosh
  ];

  xdg.configFile."chezmoi/chezmoi.toml".source = (pkgs.formats.toml { }).generate "chezmoi.toml" {
    sourceDir = "~/chezmoi";
    git = {
      autoCommit = true;
      autoPush = false;
    };
  };

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;

  programs.zsh.enable = true;
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
