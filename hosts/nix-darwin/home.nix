{
  user,
  osConfig,
  pkgs,
  ...
}:
{
  programs.home-manager.enable = true;

  home = {
    username = user;
    homeDirectory = osConfig.users.users.${user}.home;
    stateVersion = "25.11";
  };

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

  imports = [
    ../../modules
    ../../modules/font.nix
    ../../modules/starship
    ../../modules/git.nix
    ../../modules/mongodb.nix
  ];
}
