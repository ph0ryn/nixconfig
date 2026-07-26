{
  user,
  osConfig,
  pkgs,
  ...
}:
{
  programs.bash.enable = true;
  programs.home-manager.enable = true;

  home = {
    username = user;
    homeDirectory = osConfig.users.users.${user}.home;
    stateVersion = "25.11";
  };

  home.packages = with pkgs; [
    # desktop applications
    google-chrome
    zed-editor
  ];

  home.sessionPath = [
    "$HOME/.local/share/pnpm/bin"
  ];

  home.sessionVariables = {
    PNPM_HOME = "$HOME/.local/share/pnpm";
  };

  imports = [
    ../../modules
    ../../modules/git.nix
  ];
}
