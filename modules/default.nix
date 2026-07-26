{
  pkgs,
  ...
}:
{
  programs = {
    nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep-since 7d --keep-one";
      };
    };
    bat.enable = true;
    fzf.enable = true;
    ripgrep.enable = true;
  };

  home.packages = with pkgs; [
    # package managers
    uv
    (pnpm_11.override { nodejs-slim = pkgs.nodejs-slim_26; })
    ni

    # runtimes
    bun
    nodejs-slim_26
    python315
    rustup
    go
    # deno
    jdk21

    # linters & formatters
    nixfmt
    treefmt
    nil
    nixd

    # cli utilities
    prek
    tree
    filetree

    # security & crypto
    gnupg
    pinentry-tty
    openssl

    # tools
    protobuf
    ffmpeg
  ];

  home.file = {
  };

  home.sessionVariables = {
    JAVA_HOME = "${pkgs.jdk21}";
  };
}
