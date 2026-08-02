{
  user,
  osConfig,
  pkgs,
  ...
}:
{
  programs.zsh.enable = true;
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

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.local/share/pnpm/bin"
    "$HOME/.cargo/bin"
    "$ANDROID_HOME/platform-tools"
    "$ANDROID_HOME/emulator"
    "$HOME/.lmstudio/bin"
    "$HOME/.orbstack/bin"
  ];

  home.sessionVariables = {
    PNPM_HOME = "$HOME/.local/share/pnpm";
    ANDROID_HOME = "/opt/homebrew/share/android-commandlinetools";
    ANDROID_SDK_ROOT = "$ANDROID_HOME";
  };

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
    ../../modules/shell.nix
    ../../modules/starship
    ../../modules/git.nix
    ../../modules/mongodb.nix
  ];
}
