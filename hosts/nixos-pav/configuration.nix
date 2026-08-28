{
  pkgs,
  user,
  ...
}:
{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  system.stateVersion = "26.05";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config.allowUnfree = true;
  };

  networking = {
    hostName = "NixPavilion";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Tokyo";

  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;

  programs = {
    nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep-since 7d --keep-one";
      };
    };
    zsh = {
      enable = true;
      enableCompletion = false;
    };
  };

  users.users.${user} = {
    isNormalUser = true;
    description = "ph0ryn";
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "sk-ecdsa-sha2-nistp256@openssh.com AAAAInNrLWVjZHNhLXNoYTItbmlzdHAyNTZAb3BlbnNzaC5jb20AAAAIbmlzdHAyNTYAAABBBBfjUwhrps3u+xU00i7qmAGDUmyOLdgF1+mPV2L1I8+/B0EXWqkbAQQC1PJq/NhURT0rprNENMclkEKTSdJYNNoAAAAEc3NoOg== ssh:"
    ];
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  imports = [
    ./desktop.nix
    ./hardware-configuration.nix
    ./system.nix
    ./service.nix
    ./language.nix
  ];
}
