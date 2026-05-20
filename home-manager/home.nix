{
  config,
  pkgs,
  user,
  osConfig,
  ...
}:
{
  programs.home-manager.enable = true;

  home.username = user;
  home.homeDirectory = osConfig.users.users.${user}.home;

  home.stateVersion = "25.11";

  imports = [
    ./git.nix
  ];

  # packages via programs wrapper
  programs.starship.enable = true;
  programs.fzf.enable = true;

  home.packages = with pkgs; [
    # core
    chezmoi

    # package managers
    nodejs_24 # for npm
    pnpm_11
    uv
    ni

    # runtimes
    bun
    python315
    rustup
    go

    # linters & formatters
    nixfmt
    treefmt
    swiftlint
    swiftformat

    # cli utilities
    tree
    bat
    ripgrep
    prek
    yazi

    # security & crypto
    gnupg
    pinentry-tty
    openssl

    # tools
    python3Packages.huggingface-hub
    protobuf
    llama-cpp
    ffmpeg

    # gui apps
    imhex

    # MongoDB
    mongodb-ce
    mongodb-compass
    mongosh
  ];

  xdg.configFile."chezmoi/chezmoi.toml".source = (pkgs.formats.toml { }).generate "chezmoi.toml" {
    sourceDir = "~/chezmoi";
    git = {
      autoCommit = false;
      autoPush = false;
    };
  };

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };
}
