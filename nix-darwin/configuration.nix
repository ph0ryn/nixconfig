{
  self,
  user,
  hostPlatform,
  ...
}:
{
  system = {
    stateVersion = 6;
    primaryUser = "ph0ryn";
    configurationRevision = self.rev or self.dirtyRev or null;
  };
  nix.enable = false;
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users."ph0ryn".home = "/Users/ph0ryn";

  security.pam.services.sudo_local.touchIdAuth = true;

  programs.zsh.enable = true;

  imports = [
    ./nixpkgs.nix
    ./system.nix
    ./home_manager.nix
  ];
}
