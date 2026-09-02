{ user, ... }:
{
  programs.beankey = {
    enable = true;
    useBeankeyTheme = true;

    conversion = {
      typeBackslash = false;
      typeHalfSpace = true;
      optionDirectFullWidthInput = false;
      punctuationStyle = "kuten_and_toten";
    };

    zenz = {
      inferenceLimit = 3;
      profile = "学生";
      topic = "プログラミング";
      preference = "カタカナ優先";
    };
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ja_JP.UTF-8";
      LC_IDENTIFICATION = "ja_JP.UTF-8";
      LC_MEASUREMENT = "ja_JP.UTF-8";
      LC_MONETARY = "ja_JP.UTF-8";
      LC_NAME = "ja_JP.UTF-8";
      LC_NUMERIC = "ja_JP.UTF-8";
      LC_PAPER = "ja_JP.UTF-8";
      LC_TELEPHONE = "ja_JP.UTF-8";
      LC_TIME = "ja_JP.UTF-8";
    };
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        settings.inputMethod = {
          GroupOrder."0" = "Default";
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "beankey";
          };
          "Groups/0/Items/0" = {
            Name = "keyboard-us";
            Layout = "";
          };
          "Groups/0/Items/1" = {
            Name = "beankey";
            Layout = "";
          };
        };
        waylandFrontend = true;
      };
    };
  };

  home-manager.users.${user}.wayland.windowManager.niri.settings.binds = {
    "Henkan_Mode" = {
      _props = {
        allow-inhibiting = false;
        repeat = false;
      };
      spawn = [
        "fcitx5-remote"
        "-o"
      ];
    };
    "Muhenkan" = {
      _props = {
        allow-inhibiting = false;
        repeat = false;
      };
      spawn = [
        "fcitx5-remote"
        "-c"
      ];
    };
  };
}
