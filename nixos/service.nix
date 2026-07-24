{
  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;

    fstrim.enable = true;

    displayManager.autoLogin = {
      enable = true;
      user = "ph0ryn";
    };

    logind.settings.Login.IdleAction = "ignore";

    openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        KbdInteractiveAuthentication = false;
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    printing.enable = true;

    tailscale.enable = true;

    xserver.xkb = {
      layout = "jp";
      model = "pc104";
      options = "terminate:ctrl_alt_bksp";
    };
  };
}
