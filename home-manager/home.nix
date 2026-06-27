{
  config,
  pkgs,
  user,
  osConfig,
  ...
}:
let
  # Keep pnpm's Node runtime on the unoverlaid nixpkgs path so it can use the
  # public binary cache instead of rebuilding Node and its native dependencies.
  cachedPkgs = import pkgs.path {
    system = pkgs.stdenv.hostPlatform.system;
    config = pkgs.config;
  };
in
{
  programs.home-manager.enable = true;

  home.username = user;
  home.homeDirectory = osConfig.users.users.${user}.home;

  home.stateVersion = "25.11";

  imports = [
    ./git.nix
    ./nixvim
  ];

  # packages via programs wrapper
  programs.starship.enable = true;
  programs.fzf.enable = true;

  home.packages = with pkgs; [
    # core
    chezmoi

    # package managers
    (pnpm_11.override { nodejs = cachedPkgs.nodejs-slim_26; })
    uv
    ni

    # runtimes
    bun
    python315
    rustup
    go
    deno
    jdk21

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
    filetree
    frida-tools

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
    JAVA_HOME = "${pkgs.jdk21}";
  };
}
