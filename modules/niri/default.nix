{ config, ... }:
{
  imports = [ ./binds.nix ];

  wayland.windowManager.niri = {
    enable = true;
    package = null;
    portalPackage = null;
    xwaylandSatellitePackage = null;
    systemd.enable = false;

    # DMS owns the included files at runtime, outside the Nix store.
    checkConfig = false;

    settings = {
      cursor.xcursor-size = 20;

      hotkey-overlay.hide-not-bound = { };

      input = {
        keyboard.numlock = { };
        touchpad = {
          dwt = { };
          natural-scroll = { };
          scroll-factor = 0.2;
          tap = { };
        };
      };

      layout = {
        border.off = { };
        focus-ring = {
          active-color = "#63B7C5";
          on = { };
        };
      };

      overview.backdrop-color = "#132A24";

      window-rule = {
        clip-to-geometry = true;
        draw-border-with-background = false;
        geometry-corner-radius = 14;
      };

      screenshot-path = "~/Pictures/Screenshots/Screenshot_%Y-%m-%d_%H-%M-%S.png";
    };

    extraConfig = ''
      include "${config.xdg.configHome}/niri/dms/binds.kdl"
      include "${config.xdg.configHome}/niri/dms/outputs.kdl"
    '';
  };
}
