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

  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  home.packages = with pkgs; [
    # terminal
    ghostty

    # desktop applications
    google-chrome
    zed-editor
  ];

  home.sessionPath = [
  ];

  home.sessionVariables = {
  };

  imports = [
    ../../modules
    ../../modules/font.nix
    ../../modules/shell
    ../../modules/starship
    ../../modules/git.nix
  ];
}
