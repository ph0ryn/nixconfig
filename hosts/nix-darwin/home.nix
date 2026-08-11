{
  user,
  osConfig,
  pkgs,
  ...
}:
{
  programs.home-manager.enable = true;

  programs.nh = {
    enable = true;
  };

  launchd.agents.nh-clean = {
    enable = true;
    config = {
      ProgramArguments = [
        "${pkgs.nh}/bin/nh"
        "clean"
        "user"
        "--keep-since"
        "7d"
        "--keep-one"
        "--no-gc"
      ];
      StartCalendarInterval = [
        {
          Weekday = 7;
          Hour = 3;
          Minute = 0;
        }
      ];
    };
  };

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
    swiftlint
    swiftformat

    jadx
  ];

  home.sessionPath = [
    "$ANDROID_HOME/platform-tools"
    "$ANDROID_HOME/emulator"
    "$HOME/.lmstudio/bin"
    "$HOME/.orbstack/bin"
  ];

  home.sessionVariables = {
    ANDROID_HOME = "/opt/homebrew/share/android-commandlinetools";
    ANDROID_SDK_ROOT = "$ANDROID_HOME";
  };

  imports = [
    ../../modules
    ../../modules/font.nix
    ../../modules/shell
    ../../modules/starship
    ../../modules/git.nix
    ../../modules/mongodb.nix
  ];
}
