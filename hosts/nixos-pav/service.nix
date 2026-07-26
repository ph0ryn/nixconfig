{
  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;

    fstrim.enable = true;

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

    tailscale = {
      enable = true;
      extraSetFlags = [ "--hostname=NixPavilion" ];
    };

    xserver.xkb = {
      layout = "jp";
      model = "pc104";
      options = "terminate:ctrl_alt_bksp";
    };
  };
}
