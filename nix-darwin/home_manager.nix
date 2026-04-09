{
  user,
  nix-versions,
  ...
}:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "hm-backup";
  home-manager.extraSpecialArgs = {
    inherit nix-versions;
  };
  home-manager.users.${user} = {
    imports = [
      ../home-manager/home.nix
    ];
  };
}
