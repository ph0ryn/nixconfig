{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # package managers
    uv
    pnpm_11
    ni

    # runtimes
    bun
    nodejs_26
    python315
    rustup
    go
    deno
    moonbit-bin.moonbit.latest
    jdk21

    # linters & formatters
    nixfmt
    treefmt

    # security & crypto
    gnupg
    pinentry-tty
    openssl

    # tools
    ffmpeg
    indexion
    mitmproxy
    protobuf
  ];

  home.file = {
    ".nirc" = {
      text = ''
        ; fallback when no lock found
        defaultAgent=pnpm

        ; for global installs
        globalAgent=pnpm

      '';
    };
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.local/share/pnpm/bin"
    "$HOME/.cargo/bin"
  ];

  home.sessionVariables = {
    PNPM_HOME = "$HOME/.local/share/pnpm";
    JAVA_HOME = "${pkgs.jdk21}";
  };
}
