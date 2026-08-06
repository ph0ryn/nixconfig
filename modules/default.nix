{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # package managers
    uv
    (pnpm_11.override { nodejs-slim = pkgs.nodejs-slim_26; })
    ni

    # runtimes
    bun
    nodejs_26
    python315
    rustup
    go
    deno
    jdk21

    # linters & formatters
    nixfmt
    treefmt
    nil
    nixd

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
