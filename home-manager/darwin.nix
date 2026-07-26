{ pkgs, ... }:
{
  imports = [
    ./mongodb.nix
  ];

  home.packages = with pkgs; [
    # core
    chezmoi

    swiftlint
    swiftformat
  ];

  xdg.configFile."chezmoi/chezmoi.toml".source = (pkgs.formats.toml { }).generate "chezmoi.toml" {
    sourceDir = "~/chezmoi";
    git = {
      autoCommit = false;
      autoPush = false;
    };
  };
}
