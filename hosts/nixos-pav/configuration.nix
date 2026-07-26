{ user, ... }:
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

  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    description = "ph0ryn";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC6hR1m/ZVlDPp5wHzZwNQiQcG80+9+GQfCC/uOnrGjiDDgexZ92W4s6B+bdq+0y3Kru8bynoeukCIxBN3JD8Zqr76tXJlAL3KYArewhd6e4uDdo3vBsiN6ZjyJYGpvWIshuSmj4uZmLLuVuvfuxRrPYAcUV1ZbB7pkZpuLDW2NPpLN4gV+8ObAYAgmQMWWwgaiXW7+na71convRar+kBt8VTr1OG/k2Jy0zYuPIk/Fc8czgPwfTjETu6ng+RiQ3hVgpT2Yi3sSViMYnk3XkFnplntCLYGM4aQPLEPt/YUvIuY3O/smXEqbdnfhdKPyHHPZtOJpt+Ll5gVNZZi9Bh1ls3CtrRhk2Ei4oZM6qgKKRDdotpfb6aByCakxtu7HVV+G2WsTW2B/1SJtYBHOZU/VsEY5MfQlB4v0RPMvKkGcwGvcsGnihfmnJ/ffgjL9rItJSLkutZtKsa2o2oa9m9LOM7tO//7O5XXT+HT6cOB3FdpNX5e0CfHnmKzQ8CCnnFg9z7J2UXIygsykeR8o+jPDPkdAiX4f0IteqvxqhEKQ5T9e+7yP73/iJeETxENaBrZPRYbApdGlMldchHXtxCZb/p9gqva+hcgBH1BX2+5xE7U1YvIRZJKR0LVEYMX7WFN8Vvp2MGFR/VHiR5AipoS7g9VGkm6fTZh3r3s6U/if7Q== ph0ryn@AirPh0ryn.local"
    ];
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  imports = [
    ./hardware-configuration.nix
    ./system.nix
    ./service.nix
  ];
}
