{
  self,
  user,
  hostPlatform,
  ...
}:
{
  system = {
    stateVersion = 6;
    primaryUser = user;
    configurationRevision = self.rev or self.dirtyRev or null;
  };
  nix.enable = false;

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.${user}.home = "/Users/${user}";

  security.pam.services.sudo_local.touchIdAuth = true;

  programs.zsh.enable = false;

  imports = [
    ./nixpkgs.nix
    ./system.nix
    ./tailscale.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    users.${user} = {
      imports = [
        ../home-manager/home.nix
      ];
    };
  };
}
