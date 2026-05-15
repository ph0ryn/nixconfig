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
    ./gh.nix
  ];

  # packages via programs wrapper
  programs.starship.enable = true;
  programs.fzf.enable = true;

  home.packages = with pkgs; [
    # core
    git
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

    # linters & formatters
    nixfmt
    treefmt
    swiftlint
    swiftformat

    # cli utilities
    tree
    git-filter-repo
    ghq
    bat
    ripgrep
    prek

    # security & crypto
    gnupg
    pinentry-tty
    openssl

    # tools
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
      autoCommit = true;
      autoPush = false;
    };
  };

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };
}
