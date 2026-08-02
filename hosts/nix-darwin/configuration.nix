{
  self,
  user,
  ...
}:
{
  system = {
    stateVersion = 6;
    primaryUser = user;
    configurationRevision = self.rev or self.dirtyRev or null;
  };

  nix = {
    enable = false;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  security.pam.services.sudo_local.touchIdAuth = true;
  programs.zsh.enable = true;

  users.users.${user}.home = "/Users/${user}";

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
}
