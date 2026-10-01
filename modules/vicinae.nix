{ ... }:
{
  launchd.agents.vicinae-spotlight-key = {
    enable = true;
    config = {
      ProgramArguments = [
        "/usr/bin/hidutil"
        "property"
        "--set"
        (builtins.toJSON {
          UserKeyMapping = [
            {
              # Map the Spotlight key (Consumer AC Search) to F20.
              HIDKeyboardModifierMappingSrc = 51539608097; # 0xC00000221
              HIDKeyboardModifierMappingDst = 30064771183; # 0x70000006F
            }
          ];
        })
      ];
      RunAtLoad = true;
    };
  };

  programs.vicinae = {
    enable = true;
    launchd = {
      enable = true;
      autoStart = true;
    };
    settings = {
      close_on_focus_loss = true;
      consider_preedit = true;
      pop_to_root_on_close = true;
      favicon_service = "twenty";
      search_files_in_root = true;

      global_shortcuts.toggle = "F20";

      tray = {
        enabled = false;
      };

      font = {
        normal = {
          size = 12;
          family = "Maple Nerd Font";
        };
      };

      theme = {
        light = {
          name = "vicinae-light";
          icon_theme = "default";
        };
        dark = {
          name = "vicinae-dark";
          icon_theme = "default";
        };
      };

      launcher_window = {
        opacity = 0.40;
        material = "liquid_glass";
      };
    };
  };
}
