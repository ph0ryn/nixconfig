{
  self,
  nixvim,
  user,
  ...
}:
{
  system = {
    stateVersion = 6;
    primaryUser = user;
    configurationRevision = self.rev or self.dirtyRev or null;
  };

  nix.enable = false;

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  users.users.${user}.home = "/Users/${user}";

  security.pam.services.sudo_local.touchIdAuth = true;

  programs.zsh.enable = false;

  imports = [
    ./system.nix
    ./homebrew.nix
    ./tailscale.nix
  ];

  nix-homebrew = {
    enable = true;
    enableRosetta = false;
    user = user;
    autoMigrate = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    extraSpecialArgs = { inherit user nixvim; };
    users.${user} = {
      imports = [
        ../home-manager
        ../home-manager/darwin.nix
      ];
    };
  };
}
