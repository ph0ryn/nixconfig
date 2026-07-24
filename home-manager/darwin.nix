{ pkgs, ... }:
let
  # Keep pnpm's Node runtime on the unoverlaid nixpkgs path so it can use the
  # public binary cache instead of rebuilding Node and its native dependencies.
  cachedPkgs = import pkgs.path {
    system = pkgs.stdenv.hostPlatform.system;
    config = pkgs.config;
  };
in
{
  imports = [
    ./mongodb.nix
  ];

  home.packages = with pkgs; [
    (pnpm_11.override { nodejs-slim = cachedPkgs.nodejs-slim_26; })
    swiftlint
    swiftformat
  ];
}
