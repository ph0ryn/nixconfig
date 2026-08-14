{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.xwayland-satellite ];

  programs = {
    dms-shell = {
      enable = true;
      systemd.target = "niri.service";
    };
    niri.enable = true;
  };

  services.displayManager = {
    defaultSession = "niri";
    gdm.enable = true;
  };

  systemd.services."user@".path = with pkgs; [
    bash
    niri
  ];
}
