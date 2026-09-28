{ user, ... }:
{
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
  };

  home-manager.users.${user} = {
    i18n.inputMethod.fcitx5 = {
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

    wayland.windowManager.niri.settings.binds = {
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
  };
}
