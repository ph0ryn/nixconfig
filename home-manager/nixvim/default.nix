{
  nixvim,
  ...
}:
{
  imports = [
    nixvim.homeModules.nixvim
    ./settings.nix
    ./opts.nix
    ./plugins.nix
  ];
}
