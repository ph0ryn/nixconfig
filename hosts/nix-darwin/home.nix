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

  targets.darwin = {
    copyApps.enable = false;
    linkApps.enable = true;
  };

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      initContent = ''
        dsh() {
          /opt/homebrew/opt/node/bin/node \
            "$HOME/.npm-global/lib/node_modules/@deepseek-ai/dsh/lib/bin.js" "$@"
        }
      '';
    };
    git.includes = [ { path = "~/.gitconfig.local"; } ];
  };

  home.packages = with pkgs; [
    ankerscale

    jadx

    swiftlint
    swiftformat
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
    ../../modules/beankey.nix
    ../../modules/font.nix
    ../../modules/shell
    ../../modules/starship
    ../../modules/git.nix
    ./secure-enclave-key.nix
    ../../modules/zed.nix
    ../../modules/nixvim
    ../../modules/mongodb.nix
    ../../modules/vicinae.nix
  ];
}
